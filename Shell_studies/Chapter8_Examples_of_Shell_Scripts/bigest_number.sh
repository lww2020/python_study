#!/bin/bash
#
# Linux Shell Script Tutorial 1.05r3, Summer-2002
#
# Latest version can be found at http://www.nixcraft.com/
#
# Q2. Script to find out bigest number
#
# Algo:
#	1) START: Take three nos as n1,n2,n3.
#	2) Is n1 is greater than n2 and n3, if yes
#		print n1 is bigest no goto step 5, otherwise goto next step
#	3) Is n2 is greater than n1 and n3, if yes
#		print n2 is bigest no goto step 5, otherwise goto next step
#	4) Is n3 is greater than n1 and n3, if yes
#		print n3 is bigest no goto step 5, otherwise goto next step
#	5) END
#

if [[ $# -ne 3 ]]; then
	echo "$0: number1 number2 number3 are not given" >&2
	exit 1
fi
n1=$1
n2=$2
n3=$3
if [[ $n1 -gt $2 ]] && [[ $n1 -gt $3 ]]; then
	echo "$n1 is bigest number"
elif [[ $n2 -gt $n1 ]] && [[ $n2 -gt $n3 ]]; then
	echo "$n2 is bigest number"
elif [[ $n3 -gt $n1 ]] && [[ $n3 -gt $n2 ]]; then
	echo "$n3 is bigest number"
elif [[ "$n1" -eq $n2 ]] && [[ $1 -eq $3 ]] && [[ $2 -eq $3 ]]; then
	echo "All the numbers are equal"
else
	echo "I can not figure out which number is biger"
fi

#
# ./ch.sh: vivek-tech.com to nixcraft.com reference converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#