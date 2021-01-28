#!/bin/bash
echo " "
echo "Start to copy script files to /home/dynamicx"
echo ""
cp `rospack find rm_bringup`/scripts/auto_start/rm_start.sh /home/dynamicx
chmod 777 /home/dynamicx/rm_start.sh
echo " "
echo "Start to copy service files to /lib/systemd/system/"
echo ""
sudo cp `rospack find rm_bringup`/scripts/auto_start/rm_start.service  /lib/systemd/system/
echo " "
echo "Enable auto rm start! "
echo ""
sudo systemctl enable rm_start.service
echo "Finish "
