#!/bin/bash
#
# Author: Created by lww
# filename: /data/mysql/scripts/delete_shenji_file.sh
# Date: 2019-04-19
# Description: This script is used to delete logs periodically
# Version:1.1
#
#####################################################################################
LogDir="/data/mysql/shenji/data/"
HostName=`hostname`
# find "${LogDir}" -type f -mtime  +30 -name 'db_mysql_*-2019-*' -exec ls -l {} \;
# find "${LogDir}" -type f -mtime  +30 -name 'db_mysql_*-2019-*' -exec rm -rf  {} \; 

#find "${LogDir}" -type f -mtime  +30 -name 'db_mysql_*-2019-*' -exec ls -l {} \;
#find "${LogDir}" -type f -mtime  +30 -name 'db_mysql_*-2019-*' -exec rm -rf  {} \; 

find "${LogDir}" -type f -mtime  +30 -name "${HostName}-2019-*" -exec rm -rf  {} \; 

# End
