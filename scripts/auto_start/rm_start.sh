#!/bin/bash
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rm_ws:$ROS_PACKAGE_PATH
source ~/rm_ws/devel/setup.bash
export ROBOT_TYPE=drone
export ENEMY_COLOR=red
mon launch --disable-ui rm_bringup start.launch

