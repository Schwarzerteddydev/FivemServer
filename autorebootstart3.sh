echo 'FiveM LINUX REBOOT INSTALLER'
apt update && apt upgrade
cd /usr/bin/
wget https://raw.githubusercontent.com/Schwarzerteddydev/fivem-autoreboot/main/fivem_start.sh
sudo chmod +x /usr/bin/fivem_start.sh
cd /lib/systemd/system/
wget https://raw.githubusercontent.com/Schwarzerteddydev/fivem-autoreboot/main/fivem.service
sudo systemctl daemon-reload
sudo systemctl start fivem
sudo systemctl enable fivem
echo 'set permissions'
