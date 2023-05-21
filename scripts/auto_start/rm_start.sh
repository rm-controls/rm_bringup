#!/bin/bash
sudo ip link set can0 up type can bitrate 1000000
sudo ip link set can1 up type can bitrate 1000000
sudo ip link set can2 up type can bitrate 1000000
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash
source /opt/intel/openvino_2021/bin/setupvars.sh
export ROBOT_TYPE=standard5
export CAMERA_TYPE=hk_camera
export CAMERA_CLASS=HKCameraNodelet

export MVCAM_SDK_PATH=/opt/MVS

export MVCAM_COMMON_RUNENV=/opt/MVS/lib
export LD_LIBRARY_PATH=/opt/MVS/lib/64:/opt/MVS/lib/32:$LD_LIBRARY_PATH

export ENEMY_COLOR=red
export ROS_IP=192.168.100.2
mon launch --disable-ui rm_bringup start.launch

