#!/bin/bash
local_dir=`pwd`/proj
echo -n "输入工程名:"
read proj_name
mkdir -p $local_dir/$proj_name

tar -zxvf proj_make.tar.gz -C $local_dir/$proj_name/

while true
do
echo -n "输入App名字:"
read app_name
if [ -z "$app_name" ];then
	exit 1
fi

app_dir=$local_dir/$proj_name/$app_name
mkdir -p $app_dir/include/ $app_dir/scr/

tar -zxvf app_make.tar.gz -C $app_dir
done



