#!/bin/bash
echo " "
echo "Start to rosbag record some control msg to /home/dynamicx/Document"
echo ""
cp `rospack find rm_bringup`/scripts/auto_start/control_rosbag_record_service.sh /home/dynamicx
chmod 777 /home/dynamicx/control_rosbag_record_service.sh
echo " "
echo "Start to copy service files to /lib/systemd/system/"
echo ""
sudo cp `rospack find rm_bringup`/scripts/auto_start/control_rosbag_record_service.service  /lib/systemd/system/
echo " "
echo "Enable camera rosbag record! "
echo ""
sudo systemctl enable control_rosbag_record_service.service
echo "Finish "
