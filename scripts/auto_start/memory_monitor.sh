#!/bin/bash
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash

while [[ 1 ]]
do
        temp=$(df -H | grep -vE '^Filesystem|tmpfs|udev' | grep -E "^/dev.*/$" | awk '{ print $5}')
        result=$(echo "$temp" | sed -E 's/[^0-9]//g')
        if [[ $result -ge '90' ]]; then		# 如果硬盘空间占用90%以上则关停camera_rosbag_record服务
                temp=$(ps -ef | grep -E "^.*/bin/bash.*camera_rosbag_record.sh$")
                id=$(echo "$temp" | sed -E 's/^\S+\s+([0-9]+).*$/\1/g')
                echo "$id"
                kill "$id"
                exit
        fi
done
