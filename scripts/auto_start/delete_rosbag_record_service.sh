#!/bin/bash
echo " "
echo "Start to remove script files from /home/dynamicx"
echo ""
rm  ~/rosbag_record_service.sh
rm  ~/memory_monitor.sh

echo " "
echo "Start to remove service files from /lib/systemd/system/"
echo ""
sudo rm  /lib/systemd/system/rosbag_record_service.service
sudo rm  /lib/systemd/system/memory_monitor.service
echo " "
echo "Disable camera rosbag record! "
echo ""
sudo systemctl disable rosbag_record_service.service
sudo systemctl disable memory_monitor.service
echo "Finish"
