echo 'FiveM LINUX REBOOT INSTALLER'
apt update && apt upgrade
sudo nano /usr/bin/fivem_start.sh
echo -e '
[Unit]
Description=FiveM server

[Service]
Type=forking
User=root
ExecStart=/usr/bin/fivem_start.sh

[Install]
WantedBy=multi-user.target
' >> fivem.service

   sudo nano /lib/systemd/system/fivem.service
   echo -e '
#!/bin/bash
screen -dmS txadmin bash  /home/FiveM/server/run.sh +set serverProfile default +set txAdminPort 40120

' >> fivem_start.sh
echo 'FIVEM SERVER START WHIT SERVER REBOOT'

sudo chmod +x /usr/bin/fivem_start.sh
sudo systemctl daemon-reload
sudo systemctl start fivem
sudo systemctl enable fivem
echo 'set permissions'
