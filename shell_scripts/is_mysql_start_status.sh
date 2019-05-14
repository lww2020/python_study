#!/bin/bash
#
# Author: Created by lww
# filename: /data/mysql/scripts/is_start_status_mysql.sh
# Date: 2019-05-14
# Description: This script is used to start mysql server.
# Version:1.1
#
#####################################################################################
is_start_status=`ps -ef|grep -Ew 'mysqld|mysqld_safe' | grep -vw 'grep' |  wc -l`

if [[ "$is_start_status" -ne 2 ]]; then
	sleep 10
	/data/mysql/percona_server/bin/mysqld_safe --defaults-file=/data/mysql/percona_server/conf/my.cnf &
fi


cat >>/etc/rc.local <<"EOF"
# 以非root用户启动随开机启动mysql服务
su - mysql -c /data/mysql/scripts/is_start_status_mysql.sh

EOF
