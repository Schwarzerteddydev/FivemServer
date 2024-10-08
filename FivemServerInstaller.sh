#/bin/bash
echo 'FiveM LINUX AutoInstaller'
apt update && apt upgrade
apt install xf
apt install tar
mkdir -p /home/FiveM/server
cd /home/FiveM/server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/10230-aaab4384aeed5873a2353f391a1218d3950d4066/fx.tar.xz
tar xf fx.tar.xz
echo 'Artifacts Installed'
rm -r fx.tar.xz
cd /home/FiveM/
echo 'Downloading start.sh'
wget https://raw.githubusercontent.com/Schwarzerteddydev/FivemServer/main/start.sh
chmod +x start.sh
echo 'Install Screen'
apt install screen
echo 'cd /home/FiveM'
cd /home/FiveM
echo 'Erfolgreich installiert, Jetzt Must du in den Ordner cd /home/FiveM/ und die datei start.sh ausführen --> ./start.sh'
echo 'Successfully installed, Now you must go to the folder cd /home/FiveM/ and execute the file start.sh -->./start.sh'
echo 'Erfolgreich installiert, SERVER WURDE GESTARTET!!'
echo 'Successfully installed, SERVER IS STARTING UP!!'
echo 'uSE COMMAND screen -ls'
echo 'BENUTZE DEN COMMAND screen -ls'
