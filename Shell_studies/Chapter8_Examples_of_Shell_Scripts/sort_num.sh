#!/bin/bash
#
# Linux Shell Scripting Tutorial 1.05r3, Summer-2002
#
# Write by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com
#
# Q3
# Algo:
#	1) START: set value of i to 5 (since we want to start from 5, if you
#		want to start from other value put that value)
#	2) Start While Loop
#	3) Chechk, I value of i is zero, If yes goto step 5 else
#		continue with next loop
#	4) print i, decement i by 1 (i.e i=i-1 to goto zero) and
#		goto step 3
#	5) END
#
i=5
while [ $i != 0 ]; do
	echo -n "$i "
	i=`expr $i - 1`
	if [ $i == 0 ]; then
            exit 1
	fi
done
#
# ./ch.sh: vivek-tech.com to nixcraft.com referance conveted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#
