
export ROS_IP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
#export ROS_MASTER_URI=http://192.168.1.141:11311
echo "ROS IP: ${ROS_IP}
ROS Master URI: ${ROS_MASTER_URI}"

export ROS_PACKAGE_PATH=~/Project/rm-software/robot_ws:$ROS_PACKAGE_PATH
source ~/Project/rm-software/robot_ws/devel/setup.bash
