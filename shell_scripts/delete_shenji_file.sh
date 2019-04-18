#!/bin/bash
#
# Author: Created by lww
# filename: /data/mysql/scripts/delete_shenji_file.sh
# Date: 2019-04-19
# Description: This script is used to delete logs periodically
# Version:1.1
#
#####################################################################################
HostName=`hostname`
LogDir="/data/mysql/shenji/data/"
if [[ -d "${LogDir}" ]]; then
     # find "${LogDir}" -type f -mtime  +30 -name 'db_mysql_*-20*' -exec ls -l {} \;
     # find "${LogDir}" -type f -mtime  +30 -name 'db_mysql_*-20*' -exec rm -rf  {} \; 
     
     find "${LogDir}" -type f -mtime  +30 -name "${HostName}-20*" -exec rm -rf  {} \;
else
     exit

fi

# End
