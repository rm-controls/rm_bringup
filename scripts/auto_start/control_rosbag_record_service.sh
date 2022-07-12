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
        for FILEINDEX in $(seq 1 1 4)	# 20 分钟后内容将会被从头开始覆盖 
        do
                rosbag record -q -b 2048 --duration=300 -O "$FILEINDEX"  "/actuator_states" "/cmd_vel" "/controllers/chassis_controller/command" "/controllers/chassis_controller/left_back/command" "/controllers/chassis_controller/left_back/pid/state" "/controllers/chassis_controller/left_back/state" "/controllers/chassis_controller/left_front/command" "/controllers/chassis_controller/left_front/pid/state" "/controllers/chassis_controller/left_front/state" "/controllers/chassis_controller/pid_follow/state" "/controllers/chassis_controller/right_back/command" "/controllers/chassis_controller/right_back/pid/state" "/controllers/chassis_controller/right_back/state" "/controllers/chassis_controller/right_front/command" "/controllers/chassis_controller/right_front/pid/state" "/controllers/chassis_controller/right_front/state" "/controllers/cover_calibration_controller/command" "/controllers/cover_calibration_controller/state" "/controllers/cover_controller/command" "/controllers/cover_controller/pid/state" "/controllers/cover_controller/state" "/controllers/gimbal_calibration_controller/command" "/controllers/gimbal_calibration_controller/state" "/controllers/gimbal_controller/bullet_solver/model_desire" "/controllers/gimbal_controller/bullet_solver/model_real" "/controllers/gimbal_controller/command" "/controllers/gimbal_controller/error" "/controllers/gimbal_controller/pitch/command" "/controllers/gimbal_controller/pitch/pid/state" "/controllers/gimbal_controller/pitch/state" "/controllers/gimbal_controller/yaw/command" "/controllers/gimbal_controller/yaw/pid/state" "/controllers/gimbal_controller/yaw/state" "/controllers/shooter_controller/command" "/controllers/shooter_controller/friction_left/command" "/controllers/shooter_controller/friction_left/pid/state" "/controllers/shooter_controller/friction_left/state" "/controllers/shooter_controller/friction_right/command" "/controllers/shooter_controller/friction_right/pid/state" "/controllers/shooter_controller/friction_right/state" "/controllers/shooter_controller/trigger/command" "/controllers/shooter_controller/trigger/pid/state" "/controllers/shooter_controller/trigger/state" "/controllers/trigger_calibration_controller/command" "/controllers/trigger_calibration_controller/state" "/dbus_data" "/detection" "/joint_states" "/odom" "/referee" "/rm_hw/gimbal_imu/data" "/rm_hw/gimbal_imu/temperature" "/rm_hw/gimbal_imu/trigger_time" "/rm_track/linear_kf/measure" "/rm_track/linear_kf/parameter_descriptions" "/rm_track/linear_kf/parameter_updates" "/super_capacitor" "/tf" "/tf_static" "/track"
                ls -lht | grep -E "^\d.*$"  > ./rosbag_log.txt 	# 为后续确定1-4个包的时间顺序用
        done
done
