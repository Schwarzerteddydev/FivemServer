#/bin/bash
echo 'FiveM LINUX AutoInstaller, WITH ESX Included'
apt update && apt upgrade
apt install xf
apt install tar
mkdir -p /home/FiveMServer/server
cd /home/FiveMServer/server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/4162-b20486b86a968b9e0d36b10cc7c88d83de579e79/fx.tar.xz
tar xf fx.tar.xz
echo 'Artifacts Installed'
echo 'Installing Server-Data'
mkdir -p /home/FiveMServer/server-data
cd /home/FiveMServer/server-data
git clone https://github.com/citizenfx/cfx-server-data.git /home/FiveMDevServer/server-data && chmod -R 777 *
cd /home/FiveMServer/server-data
touch esx.cfg
echo -e '
ensure async
ensure cron
ensure es_camera
ensure es_extended
ensure esx_accessories
ensure esx_addonaccount
ensure esx_addoninventory
ensure esx_ambulancejob
ensure esx_animations
ensure esx_bankerjob
ensure esx_barbershop
ensure esx_basicneeds
ensure esx_billing
ensure esx_boat
ensure esx_boilerplate
ensure esx_clotheshop
ensure esx_cruisecontrol
ensure esx_datastore
ensure esx_dmvschool
ensure esx_drugs
ensure esx_holdup
ensure esx_identity
ensure esx_joblisting
ensure esx_jobs
ensure esx_license
ensure esx_lscustom
ensure esx_adminplus
ensure esx_mechanicjob
ensure esx_menu_default
ensure esx_menu_dialog
ensure esx_menu_list
ensure esx_migrate
ensure esx_optionalneeds
ensure esx_policejob
ensure esx_realestateagentob
ensure esx_rpchat
ensure esx_service
ensure esx_shops
ensure esx_sit
ensure esx_skin
ensure esx_society
ensure esx_status

ensure esx_taxijob
ensure esx_weaponshop
ensure instance
ensure skinchanger
##ensure esx_duty
ensure esx_identity
' >> esx.cfg

   touch server.cfg
   echo -e '
# Only change the IP if youre using a server with multiple network interfaces, otherwise change the port only.
set es_enableCustomData 1 
##Configure your Database
#set mysql_connection_string "server=localhost;database=es_extended;userid=name;password="
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

# These resources will start by default.
ensure mapmanager
ensure chat
ensure spawnmanager
ensure basic-gamemode
ensure hardcap
ensure rconlog
ensure sessionmanager
ensure sessionmanager
ensure mysql-async
ensure anticheese
ensure EasyAdmin
ensure eneko_agacharse
ensure mumble-voip
ensure rp-radio
ensure atg-antipeds
#exec utils.cfg
exec esx.cfg
ensure redux_user_peds
ensure esx_tpm
ensure np_carryped
ensure nm_hud
ensure np_carhud
# This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
# Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players wont be able to use external plugins.
sv_scriptHookAllowed 0

# Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
#rcon_password ""

# A comma-separated list of tags for your server.
# For example:
# - sets tags "drifting, cars, racing"
# Or:
# - sets tags "roleplay, military, tanks"
sets tags "roleplay,esx, autoinstalled"



# A valid locale identifier for your servers primary language.
# For example "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR"
sets locale "es-ES" 
# please DO replace root-AQ on the line ABOVE with a real language! :)

# Set an optional server info and connecting banner image url.
# Size doesnt matter, any banner sized image will be fine.
#sets banner_detail "https://url.to/image.png"
#sets banner_connecting "https://url.to/image.png"

# Set your servers hostname
sv_endpointprivacy true

sv_hostname "FXServer But Unconfigured"

# Nested configs!
#exec server_internal.cfg

# Loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars which can be used in scripts
set temp_convar "hey world!"

# Remove the `#` from the below line if you do not want your server to be listed in the server browser.
# Do not edit it if you *do* want your server listed.
sv_master1 ""

# Add system admins
add_ace resource.essentialmode command.add_principal allow
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but dont allow quit
add_principal identifier.steam:YOURID group.admin # add the admin to the group


add_ace group.superadmin easyadmin allow

add_ace group.supp easyadmin.kick allow						
add_ace group.supp easyadmin.teleport allow						
add_ace group.supp easyadmin.freeze allow
add_ace group.supp easyadmin.spectate allow

add_ace group.admin easyadmin.kick allow							
add_ace group.admin easyadmin.teleport allow			
add_ace group.admin easyadmin.ban allow			
add_ace group.admin easyadmin.freeze allow
add_ace group.admin easyadmin.unban allow
add_ace group.admin easyadmin.spectate allow

restart sessionmanager

# enable OneSync (required for server-side state awareness)
set onesync on

# Server player slot limit (see https://fivem.net/server-hosting for limits)
sv_maxclients 48

# Steam Web API key, if you want to use Steam authentication (https://steamcommunity.com/dev/apikey)
# -> replace "" with the key
set steam_webApiKey ""

# License key for your server (https://keymaster.fivem.net)
sv_licenseKey ""
' >> server.cfg
echo 'Default Resources Installed'
echo 'Installing ESX'
cd /home/FiveMServer/server-data/resources/
git clone https://github.com/zap-fivem/esx_12.git [ESX]
echo 'Installing mysql-async'
cd /home/FiveMServer/server-data/resources/
mkdir -p [SQL]
cd /home/FiveMServer/server-data/resources/[SQL]
git clone https://github.com/brouznouf/fivem-mysql-async.git mysql-async
echo 'MySQL-Async Installed'
echo 'Installing some gift scripts'
cd /home/FiveMServer/server-data/resources/
mkdir -p [Admin]
cd /home/FiveMServer/server-data/resources/[Admin]
git clone https://github.com/Blumlaut/EasyAdmin.git
git clone https://github.com/Blumlaut/anticheese-anticheat.git anticheese
mkdir -p [ESX]
cd /home/FiveMServer/server-data/resources/[Admin]/[ESX]
git clone https://github.com/qalle-git/esx_marker.git esx_tpm
cd /home/FiveMServer/server-data/resources/
mkdir -p [Voice]
cd /home/FiveMServer/server-data/resources/[Voice]
git clone https://github.com/lizarragaeneko/mumble-voip.git mumble-voip
git clone https://github.com/FrazzIe/rp-radio.git [RPRadio]
cd /home/FiveMServer/server-data/resources/
mkdir -p [AntiCheats]
cd /home/FiveMServer/server-data/resources/[AntiCheats]
git clone https://github.com/ATG-Github/atg-antiped.git
cd /home/FiveMServer/server-data/resources/[AntiCheats]/atg-antiped
rm -r README.md
cd /home/FiveMServer/server-data/resources/
mkdir -p [Scripts]
cd /home/FiveMServer/server-data/resources/[Scripts]
git clone https://github.com/lizarragaeneko/agacharse.git eneko_agacharse
git clone https://github.com/REDUX-SYSTEMS/USER_PEDS.git redux_user_peds
git clone https://github.com/string-null/np_carryped.git
cd /home/FiveMServer/server-data/resources/[Scripts]/np_carryped
rm -r server/
cd /home/FiveMServer/server-data/resources/[Scripts]
git clone https://github.com/string-null/nm_hud.git
git clone https://github.com/string-null/np_carhud.git
cd /home/FiveMServer/server-data/resources/[Scripts]/np_carhud
rm -r version_check.lua
cd /home/FiveMServer/server-data
git clone https://github.com/lizarragaeneko/FiveMAutoInstallerSql.git [Sql]
cd /home/FiveMServer/server
rm -r fx.tar.xz

echo 'Succesfully Installed, now add the sql of the folder [Sql] in /home/FiveMServer/server-data/[Sql] to your mysql server, that will create a database and then configure all the things of the admin in server.cfg'