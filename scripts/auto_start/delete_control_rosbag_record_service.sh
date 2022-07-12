#!/bin/bash
echo " "
echo "Start to remove script files from /home/dynamicx"
echo ""
rm  ~/control_rosbag_record_service.sh

echo " "
echo "Start to remove service files from /lib/systemd/system/"
echo ""
sudo rm  /lib/systemd/system/control_rosbag_record_service.service
echo " "
echo "Disable control rosbag record! "
echo ""
sudo systemctl disable control_rosbag_record_service.service 
echo "Finish"
