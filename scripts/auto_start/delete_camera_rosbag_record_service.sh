#!/bin/bash
echo " "
echo "Start to remove script files from /home/dynamicx"
echo ""
rm  ~/camera_rosbag_record_service.sh
rm  ~/memory_monitor.sh

echo " "
echo "Start to remove service files from /lib/systemd/system/"
echo ""
sudo rm  /lib/systemd/system/camera_rosbag_record_service.service
sudo rm  /lib/systemd/system/memory_monitor.service
echo " "
echo "Disable camera rosbag record! "
echo ""
sudo systemctl disable camera_rosbag_record_service.service 
sudo systemctl disable memory_monitor.service
echo "Finish"
