#/bin/bash
echo 'FiveM LINUX AutoInstaller, WITH ESX Included'
apt update && apt upgrade
apt install xf
apt install tar
mkdir -p /home/FiveM/server
cd /home/FiveM/server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5886-22ff65cf6e181d949570bca03b3d15e3e5ed55f1/fx.tar.xz
tar xf fx.tar.xz
echo 'Artifacts Installed'
echo 'Installing Server-Data'
rm -r fx.tar.xz
cd /home/FiveM/server
wget https://raw.githubusercontent.com/Schwarzerteddydev/FivemServer/main/start.sh
chmod +x start.sh
echo 'Succesfully Installed, now add the sql of the folder [Sql] in /home/FiveM/server-data/[Sql] to your mysql server, that will create a database and then configure all the things of the admin in server.cfg'
