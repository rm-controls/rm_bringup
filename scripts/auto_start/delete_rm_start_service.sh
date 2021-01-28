#!/bin/bash
echo " "
echo "Start to remove script files from /home/dynamicx"
echo ""
rm  /home/dynamicx/rm_start.sh

echo " "
echo "Start to remove service files from /lib/systemd/system/"
echo ""
sudo rm  /lib/systemd/system/rm_start.service
echo " "
echo "Disable auto rm start! "
echo ""
sudo systemctl disable rm_start.service
echo "Finish"
