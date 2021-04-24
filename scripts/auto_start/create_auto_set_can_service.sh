#!/bin/bash
echo " "
echo "Start to copy script files to /home/dynamicx"
echo ""
cp `rospack find rm_bringup`/scripts/auto_start/AutoSetCan.sh /home/dynamicx
chmod 777 /home/dynamicx/AutoSetCan.sh
echo " "
echo "Start to copy service files to /lib/systemd/system/"
echo ""
sudo cp `rospack find rm_bringup`/scripts/auto_start/AutoSetCan.service  /lib/systemd/system/
echo " "
echo "Enable auto set can! "
echo ""
sudo systemctl enable AutoSetCan.service
echo "Finish "
