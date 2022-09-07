#!/bin/bash
if [[ $# -eq 0 ]];then
        echo "Please enter service files name"
	exit 1
fi
for service in "$@"; do	# service_name 变量将会接收多个服务文件名
	echo " "
	echo "Start to remove script files from /home/dynamicx"
	echo ""
	rm "/home/dynamicx/${service}.sh"
	echo " "
	echo "Start to remove service files from /lib/systemd/system/"
	echo ""
	sudo rm  "/lib/systemd/system/${service}.service"
	echo " "
  	echo "Disable $service ! "
	echo ""
	sudo systemctl stop "${service}.service"
	sudo systemctl disable "${service}.service"
	if [[ "$?" -eq 0 ]];then
		echo "Successfully deleted $service."
	elif [[ "$?" -eq 1 ]];then
		echo "Failed to delete $service."
	else
		echo "Unknown error."
	fi
done

