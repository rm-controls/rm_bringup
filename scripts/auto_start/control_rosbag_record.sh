#!/bin/bash

source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash

if [[ ! -d ~/Documents/control/ ]]; then
	mkdir -p ~/Documents/control/
fi
cd ~/Documents/control/

newdir=$(date "+%Y%m%d_%H_%M")
newhour=$(date "+%Y%m%d_%H")
dir=$(ls -t | grep "$newhour" | head -n1)
if [[ -d "$newdir" ]]; then	# 同一分钟内只录制一份
	cd $newdir
elif [[ "$dir" != "" ]]; then	# 相邻约5分钟内只录制一份，防止多次开断电生成多个文件夹
	min=$(echo "$dir" | sed -E 's/^.*_.*_(.*)$/\1/g')
	newmin=$(date "+%M")
	if [[ $(expr $newmin - $min) -ge 5 ]]; then
		mkdir "$newdir"
		cd "$newdir"
	else
		mv ./$dir $(date "+%Y%m%d_%H_%M")
		cd $(date "+%Y%m%d_%H_%M")
	fi
else 
	mkdir "$newdir"		# Documents下目录为空的时候创建新目录
	cd "$newdir"
fi

while [[ 1 ]] 
do 
        for FILEINDEX in $(seq 1 1 5)	# 25 分钟后内容将会被从头开始覆盖 
        do
		rosbag record -q -b 2048 --duration=300 -O "$FILEINDEX" -e "/actuator_states" "/cmd_vel" "/controllers/(.*)" "/dbus_data" "/detection" "/joint_states" "/odom" "/rm_referee/(.*)" "/rm_hw/(.*)" "/rm_track/(.*)" "/tf" "/tf_static" "/manual_to_referee" "/track" "/rosout" "/cmd_chassis" "/state"
		ls -lht | grep -E "^\d.*$"  > ./rosbag_log.txt 	# 为后续确定1-4个包的时间顺序用
        done
done
