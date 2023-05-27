#!/bin/bash
sudo ip link set can0 up type can bitrate 1000000
sudo ip link set can1 up type can bitrate 1000000
sudo ip link set can2 up type can bitrate 1000000
sudo ip link set can3 up type can bitrate 1000000
source /opt/ros/noetic/setup.bash
source ~/rm_ws/devel/setup.bash
source ~/mpc_ws/devel/setup.bash
source /opt/intel/openvino_2021/bin/setupvars.sh
source ~/environment.sh
if [[ $HAS_SWITCH == has ]]; then
  export ROS_IP=192.168.100.2
else
  export ROS_IP=127.0.0.1
fi
mon launch --disable-ui rm_bringup $LAUNCH.launch
