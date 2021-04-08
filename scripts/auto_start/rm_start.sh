#!/bin/bash
sudo ip link set can0 up type can bitrate 1000000
sudo ip link set can1 up type can bitrate 1000000
source /opt/ros/noetic/setup.sh
export ROS_PACKAGE_PATH=/home/dynamicx/rm_ws:$ROS_PACKAGE_PATH
source /home/dynamicx/rm_ws/devel/setup.bash
export ROBOT_TYPE=sentry
export ENEMY_COLOR=red
export ROS_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1')
if test -z "${ROS_IP}"; then
  export ROS_IP=$(dig +short localhost)
fi
roslaunch rm_bringup start.launch
