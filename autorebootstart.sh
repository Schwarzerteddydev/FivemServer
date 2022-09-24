touch /lib/systemd/system/fivem.service
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

   touch /usr/bin/fivem_start.sh
   echo -e '
#!/bin/bash
screen -dmS txadmin bash  /home/FiveM/server/run.sh +set serverProfile default +set txAdminPort 40120

' >> fivem_start.sh
echo 'FIVEM SERVER START WHIT SERVER REBOOT'
