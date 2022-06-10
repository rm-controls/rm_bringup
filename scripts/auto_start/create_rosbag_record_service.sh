#!/bin/bash
echo " "
echo "Start to rosbag record camera msg to /home/dynamicx/Document"
echo ""
cp `rospack find rm_bringup`/scripts/auto_start/bag_record_service.sh /home/dynamicx
cp `rospack find rm_bringup`/scripts/auto_start/memory_monitor.sh /home/dynamicx
chmod 777 /home/dynamicx/bag_record_service.sh
chmod 777 /home/dynamicx/memory_monitor.sh
echo " "
echo "Start to copy service files to /lib/systemd/system/"
echo ""
sudo cp `rospack find rm_bringup`/scripts/auto_start/rosbag_record_service.service  /lib/systemd/system/
sudo cp `rospack find rm_bringup`/scripts/auto_start/memory_monitor.service  /lib/systemd/system/
echo " "
echo "Enable camera rosbag record! "
echo ""
sudo systemctl enable bag_record_service.service
sudo systemctl enable memory_monitor.service
echo "Finish "
