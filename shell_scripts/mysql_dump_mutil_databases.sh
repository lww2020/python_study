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



# 导入脚本
#!/bin/bash

#######################################################
# Function: import databases
# Author: davie
# Date: 2019-05-20
# Version: 1.0
# Script name: /usr/local/scripts/mutiple_database_import.sh
# http://www.cnblogs.com/bjx2020/
#######################################################

Date_time=`date +%F_%H_%M`
Host="192.168.100.100"
User_name="admin"
Pass_word="admin_password"
Back_dir="/data/mysql/lww_dump/192.168.100.100_dump"
Mysql_cmd="/usr/local/mysql/bin"
Log_file="/data/mysql/lww/lww_dump/logs"


ls "${Back_dir}"  | while read dbfile;
do
        /usr/bin/gunzip "${dbfile}" | "${Mysql_cmd}"/mysql -h "${Host}" -u"${User_name}" -p"${Pass_word}"
        if [ $? -eq 0 ]; then 
				echo "${Date_time}" >>"${Log_file}"/"${Host}".import.logs
                echo ""${dbfile}" ok" >>"${Log_file}"/"${Host}".import.logs
        else	
				echo "${Date_time}" >>"${Log_file}"/"${Host}".import.logs
                echo ""${dbfile}" error" >>"${Log_file}"/"${Host}".import.logs
        fi 
done
