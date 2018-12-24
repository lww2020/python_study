#!/bin/bash
#
# Script to test while statement
#
# 
if [ $# -eq 0 ]; then
	echo "Error - Number missing form command line line argument"
	echo "Sync : $0 number"
	echo " Use to print multiplication table for given number"
exit 1 
fi

n=$1
i=1
while [ $i -le 10 ];
do
	echo "$n * $i = `expr $i \* $n`"
	i=`expr $i + 1`
done


#1、开发、测试、生产、数据库环境交付;
#2、生产数据库日常上线处理，包括问题和新需求处理等;
#3、开发、测试数据库问题处理；
#3、数据安全、告警等检查；
#4、处理开发人员遇到的问题，跟踪解决阿里云关于数据库的工单问题;
