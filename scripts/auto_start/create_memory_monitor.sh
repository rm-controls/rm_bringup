#!/usr/bin/bash
while [[ 1 ]]
do
	temp=$(df | grep -E "^/dev/nvme.*/$")
	result=$(echo "$temp" | sed -E 's/^.*([0-9]{1,3}).*$/\1/')
	if [[ $result -ge '90' ]]; then
		temp=$(ps -ef | grep -E "^.*/usr/bin/bash.*create_rosbag_record_service.sh$")
		id=$(echo "$temp" | sed -E 's/^\S+\s+([0-9]+).*$/\1/g')
		kill "$id"
		exit
	fi
done
