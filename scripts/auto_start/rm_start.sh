#!/bin/bash
sudo ip link set can0 up type can bitrate 1000000
sudo ip link set can1 up type can bitrate 1000000
sudo ip link set can2 up type can bitrate 1000000
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash
sudo apt update && sudo apt upgrade -y
source /opt/intel/openvino_2021/bin/setupvars.sh
export ROBOT_TYPE=hero
export CAMERA_TYPE=hk_camera
export CAMERA_CLASS=HKCameraNodelet

export MVCAM_SDK_PATH=/opt/MVS

export MVCAM_COMMON_RUNENV=/opt/MVS/lib
export LD_LIBRARY_PATH=/opt/MVS/lib/64:/opt/MVS/lib/32:$LD_LIBRARY_PATH

export ENEMY_COLOR=red
ip="192.168.1.103"
export ROS_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1')
for i in {1..10}
do
    if [ "$ROS_IP" = "$ip" ]
    then
        break
    else
        sleep 1
        ROS_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1')
    fi
done
if test -z "${ROS_IP}"; then
  export ROS_IP=$(dig +short localhost)
fi
export ROS_MASTER_URI=http://$ROS_IP:11311
mon launch --disable-ui rm_bringup start.launch

