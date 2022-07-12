#!/bin/bash
while [[ 1 ]]
do
        temp=$(df -H | grep -vE '^Filesystem|tmpfs|udev' | grep -E "^/dev.*/$" | awk '{ print $5}')
        result=$(echo "$temp" | sed -E 's/[^0-9]//g')
        if [[ $result -ge '90' ]]; then
                temp=$(ps -ef | grep -E "^.*/bin/bash.*camera_rosbag_record_service.sh$")
                id=$(echo "$temp" | sed -E 's/^\S+\s+([0-9]+).*$/\1/g')
                echo "$id"
                kill "$id"
                exit
        fi
done
