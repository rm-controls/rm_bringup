#!/bin/bash
echo " "
echo "Start to remove script files from /home/dynamicx"
echo ""
if [[ $# -eq 0 ]];then
        echo "Please enter service files name"
	exit
fi
service_name="$@"       # service_name 变量将会接收多个服务文件名
for service in "$service_name"; do
	rm "~/${service}.sh"
done

echo " "
echo "Start to remove service files from /lib/systemd/system/"
echo ""
for service in "$service_name"; do 
	sudo rm  "/lib/systemd/system/${service}.service"
done
echo " "
echo "Disable $service_name ! "
echo ""
for service in "$service_name"; do
	sudo systemctl disable "${service}.service" 
done
echo "Finish"
