#!/usr/bin/bash

if [[ ! -d ~/Documents ]]; then
	mkdir ~/Documents
fi
cd ~/Documents

newdir=$(date "+%Y%m%d_%H_%M")
newhour=$(date "+%Y%m%d_%H")
dir=$(ls -t | grep "$newhour" | head -n1)
if [[ -d "$newdir" ]]; then	# 同一分钟内只录制一份
	cd $newdir
elif [[ "$dir" != "" ]]; then	# 相邻约10分钟内只录制一份，防止多次开断电生成多个文件夹
	min=$(echo "$dir" | sed -E 's/^.*_.*_(.*)$/\1/g')
	newmin=$(date "+%M")
	if [[ $(expr $newmin - $min) -ge 10 ]]; then
		mkdir "$newdir"
	else
		mv ./$dir $(date "+%Y%m%d_%H_%M")
		cd $(date "+%Y%m%d_%H_%M")
	fi
else 
	mkdir "$newdir"		# Documents下目录为空的时候创建新目录
	cd "$newdir"
fi

while [[ 1 ]] 
do 
        for FILEINDEX in $(seq 1 1 4)	# 20 分钟后内容将会被从头开始覆盖 
        do
                rosbag record -q -b 2048 --duration=300 -O "$FILEINDEX"  /galaxy_camera/image_raw
                ls -lht | grep -E "^\d.*$"  > ./rosbag_log.txt 	# 为后续确定1-4个包的时间顺序用
        done
done
