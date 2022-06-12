#!/bin/bash
while [[ 1 ]]
do
	temp=$(df | grep -E "^/dev.*/$")
	result=$(echo "$temp" | sed 's/^\/dev.*\([0-9].\)%.*/\1/g')
	if [[ $result -ge '90' ]]; then
		temp=$(ps -ef | grep -E "^.*/bin/bash.*rosbag_record_service.sh$")
		id=$(echo "$temp" | sed -E 's/^\S+\s+([0-9]+).*$/\1/g')
		kill "$id"
		exit
	fi
done
