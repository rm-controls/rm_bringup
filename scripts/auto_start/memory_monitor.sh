#!/bin/bash
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash

is_deleted=0
while [[ 1 ]]
do
	if [[ -d ~/Documents/control/ ]]; then
		if [[ $is_deleted -eq 0 ]]; then
			cd ~/Documents/control/
			current_date=$(date "+%d")
			current_month=$(date "+%m")
			lines=$(ls -1 | wc -l)
			for((i=1;i<=$lines;i++));
			do
				dir=$(ls -1 | sed -n ${i}p)
				dir_month=$(echo $dir | sed -E 's/^\d{4}(\d{2}).*/\1/g')
				if [[ $dir_month -lt $current_month ]]; then	# 删除上个月的录制内容
					sudo rm -rf $dir
					is_deleted=1
					continue
				fi
				dir_date=$(echo $dir | sed -E 's/^\d{6}(\d{2}).*/\1/g')	#删除七天前的录制内容
				if [[ $(expr $current_date - $dir_date) -ge 7 ]]; then
					sudo rm -rf $dir
					is_deleted=1
				fi
			done
		fi
	fi
	temp=$(df -H | grep -vE '^Filesystem|tmpfs|udev' | grep -E "^/dev.*/$" | awk '{ print $5}')
        result=$(echo "$temp" | sed -E 's/[^0-9]//g')
        if [[ $result -ge '90' ]]; then		# 如果硬盘空间占用90%以上则关停 control_rosbag_record 和 camera_rosbag_record服务
                camera=$(ps -ef | grep -E "^.*/bin/bash.*camera_rosbag_record.sh$")
		camera_rosbag_id=$(echo "$camera" | sed -E 's/^\S+\s+([0-9]+).*$/\1/g')
		kill "$camera_rosbag_id"
		control=$(ps -ef | grep -E "^.*/bin/bash.*control_rosbag_record.sh$")
		control_rosbag_id=$(echo "$control" | sed -E 's/^\S+\s+([0-9]+).*$/\1/g')
		kill "$control_rosbag_id"
		echo "90% of hard disk space remaining, please clean space."
		exit
        fi
done
