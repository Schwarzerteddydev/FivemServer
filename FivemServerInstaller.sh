#/bin/bash
echo 'FiveM LINUX AutoInstaller'
apt update && apt upgrade
apt install xf
apt install tar
mkdir -p /home/FiveM/server
cd /home/FiveM/server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5886-22ff65cf6e181d949570bca03b3d15e3e5ed55f1/fx.tar.xz
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
