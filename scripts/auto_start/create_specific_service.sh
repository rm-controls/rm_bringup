#!/bin/bash
if [[ $# -eq 0 ]];then
	echo "Please enter service files name"
	exit
fi
service_name="$@"	# service_name 变量将会接收多个服务文件名

echo " "
echo "Start to create $service_name service"
echo ""
for service in "$service_name"; do
	file_path="$(rospack find rm_bringup)/scripts/auto_start/${service}.sh"		# 要求.sh文件格式为{服务名.sh}
	if [[ ! -a "$file_path" ]];then
		echo "Please name the file according to the 'service-name.sh' format."
		exit
	fi
	cp "$file_path" "/home/dynamicx"
	chmod 777 "/home/dynamicx/${service}.sh"
done

echo " "
echo "Start to copy service files to /lib/systemd/system/"
echo ""

for service in "$service_name"; do
	file_path="$(rospack find rm_bringup)/scripts/auto_start/${serivce}.service"	# 要求.service文件格式为{服务名.service}
	if [[ ! -a "$file_path" ]];then
		echo "Please name the file according to the 'service-name.service' format."
		exit
	fi
	sudo cp "$file_path"  "/lib/systemd/system/"
done

echo " "
echo "Enable $service_name service! "
echo ""

for service in "$service_name"; do	
	sudo systemctl enable ${service}.service
done

echo "Finish "
