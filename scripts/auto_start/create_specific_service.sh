#!/bin/bash
if [[ $# -eq 0 ]];then
	echo "Please enter service files name"
	exit 1
fi

for service in "$@"; do	# service_name 变量将会接收多个服务文件名
	echo " "
	echo "Start to create $service service"
	echo ""
	script_path="$(rospack find rm_bringup)/scripts/auto_start/${service}.sh"		# 要求.sh文件格式为{服务名.sh}
	if [[ ! -a "$script_path" ]];then
		echo "${script_path} no found.Please name the file according to the 'service-name.sh' format."
		exit 1
	fi
	cp "$script_path" "/home/dynamicx"
	chmod 777 "/home/dynamicx/${service}.sh"

	echo " "
	echo "Start to copy service files to /lib/systemd/system/"
	echo " "
	service_path="$(rospack find rm_bringup)/scripts/auto_start/${service}.service"	# 要求.service文件格式为{服务名.service}
	if [[ ! -a "$service_path" ]];then
		echo "${service_path} no found.Please name the file according to the 'service-name.service' format."
		exit 1
	fi
	sudo cp "$service_path"  "/lib/systemd/system/"
	echo " "
	echo "Enable $service service! "
	echo ""
	sudo systemctl enable ${service}.service
 	echo "Successfully create ${service} service."
done
