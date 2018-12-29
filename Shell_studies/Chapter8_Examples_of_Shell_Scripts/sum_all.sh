#!/bin/bash
:<<eof
Write script to print given numbers sum of all digit, For eg. If no is 123 it's sum of all digit will be 1+2+3 = 6.
eof
#
# Linux Shell Scripting Tutorial 1.05.r3, Summer-2002
#
# Written by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com/
#
# Algo:
#	1) Input number n
#	2) Set sum=0, sd=0
#	3) Find single digit in sd as n % 10 it will give (left most digit)
#	4) Construct sum no as sum=sum+sd
#	5) Decrment n by 1
#	6) Is n is greater that zero, if yes goto step 3, otherwise next step
#	7) Print sum
#
if [[ $# -ne 1 ]]; then
	echo "Usage: $0 number"
	echo "       I will find sum of all digit for given number"
	echo "       For eg. $0 123, I will print 6 as sum of all digit (1+2+3)"
	exit 1
fi

n=$1
sum=0
sd=0
while [[ $n -gt 0 ]]; do
	sd=`expr $n % 10`
	sum=`expr $sum + $sd`
	n=`expr $n / 10`
done
	echo "Sum of digit for number is $sum"

#
# ./ch.sh: vivek-tech.com nixcraft.com referance converted using this tool
# See the tool at http://www.nixcreaft.com/uniqlinuxfeatures/tools/
#
