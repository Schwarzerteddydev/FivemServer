#!/bin/bash

echo 'FiveM LINUX AutoUpdater'

# Schließe den Screen mit dem Namen "fivem", falls er bereits läuft
screen -S fivem -X quit

# Verzeichnis für den FiveM-Server erstellen
cd /home/FiveM/server || { echo "Directory '/home/FiveM/server' not found. Exiting."; exit 1; }

# Funktion zum Herunterladen einer Datei definieren
download_file() {
    local url="$1"
    local filename="$2"
    
    echo "Downloading $filename..."
    wget "$url" -O "$filename"
    if [ $? -ne 0 ]; then
        echo "Failed to download $filename. Exiting."
        exit 1
    fi
}

# Dynamisches Abrufen der URL für die neueste Version von FiveM
# Runtime Version 
readarray -t VERSIONS <<< $(curl -s https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/ | egrep -m 3 -o '[0-9].*/fx.tar.xz')

latest_recommended=$(echo "${VERSIONS[0]}" | cut -c 1-4)
latest=$(echo "${VERSIONS[2]}" | cut -c 1-4)

export OPTIONS=("latest recommended version -> $latest_recommended" "latest version -> $latest" "choose custom version" "do nothing")

# Auswahl der Version durch den Benutzer
bashSelect() {
    echo "Select a version:"
    select option in "${OPTIONS[@]}"; do
        case $REPLY in
            1) runtime_link="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSIONS[0]}"; break;;
            2) runtime_link="https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${VERSIONS[2]}"; break;;
            3) read -p "Enter the download link: " runtime_link; break;;
            4) exit;;
            *) echo "Invalid option. Please select a valid option."; continue;;
        esac
    done
}

bashSelect

# Aufruf der Funktion, um die Datei herunterzuladen
download_file "$runtime_link" "fx.tar.xz"

tar xf fx.tar.xz

echo 'Artifacts Installed'

# Heruntergeladenes Archiv bereinigen
rm -f fx.tar.xz

# In das FiveM-Verzeichnis wechseln
cd /home/FiveM || { echo "Directory '/home/FiveM' not found. Exiting."; exit 1; }

# Starte die start.sh-Datei (angenommen, dies startet den FiveM-Server)
./start.sh

echo 'Update completed successfully.'
