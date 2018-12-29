#!/bin/bash
:<<EOF
Q.5.Write Script to see current date, time, username, and current directory
EOF

#
# Linux Shell Scripting Tutorial 1.05r3, Summer-2002
#
# Written by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com/
#
# Q5
#
echo "Hello, $LOGNAME"
echo "Current date is `date`"
echo "User is `who i am`"
echo "Current directory `pwd`"

#
# ./ch.sh: vivek-tech.com to nixcraft.com reference converted using this tool
# See the tool at http://www.nixcraft.com/uniqliunxfeatures/tools/
#