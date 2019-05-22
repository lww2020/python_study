#############################################
#!/bin/bash

#######################################################
# Function: dump databases
# Author: davie
# Date: 2019-05-20
# Version: 1.0
# Script name: /usr/local/scripts/mutiple_database_dump.sh
# http://www.cnblogs.com/bjx2020/
#######################################################

Date_time=`date +%F_%H_%M`
Host="192.168.100.100"
User_name="admin"
Pass_word="admin_password"
Back_dir="/data/mysql/lww_dump/192.168.100.100_dump"
Mysql_cmd="/usr/local/mysql/bin"

if [ ! -d $"Back_dir"  ] ;then
    mkdir -p "${Back_dir}"
fi

"${Mysql_cmd}"/mysql -h "${Host}" -u"${User_name}" -p"${Pass_word}" -e "show databases"|grep -Evi 'Database|information_schema|mysql|performance_schema' | while read db;
do
	echo "$db"
	"${Mysql_cmd}"/mysqldump -h "${Host}"  -u"${User_name}" -p"${Pass_word}" --opt --hex-blob --default-character-set=utf8mb4  --skip-tz-utc  --single-transaction --master-data=2 -B "${db}" | gzip> "${Back_dir}"/"${db}"."${Date_time}".sql.gz &
	
done



