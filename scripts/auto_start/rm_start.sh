#!/bin/bash
sudo ip link set can0 up type can bitrate 1000000
sudo ip link set can1 up type can bitrate 1000000
source /opt/ros/noetic/setup.sh
export ROS_PACKAGE_PATH=/home/dynamicx/rm_ws:$ROS_PACKAGE_PATH
source /home/dynamicx/rm_ws/devel/setup.bash

roslaunch rm_bringup start.launch


