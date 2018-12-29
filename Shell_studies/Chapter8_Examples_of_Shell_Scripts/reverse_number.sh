#!/bin/bash
#
:<<eof
Q.6.Write script to print given number in reverse order, for eg. If no is 123 it must print as 321.
eof

# Linux Shell Scripting Tutorial 1.05r3, Summer-2002
#
# Linux by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com
#
# Script to reverse given no
#
# Algo:
#	1) Input number n
#	2) Set rev=0, sd=0
#	3) Find single digit in sd as n % 10 it will give (left most digit)
#	4) Construct reverse no as rev * 10 + sd
#	5) Decrement n by 1
#	6) Is n is greater than zero, if yes goto step 3, otherwise next step
#	7) Print rev
#
if [[ $# -ne 1 ]]; then
	echo "Usage: $0 number"
	echo "       I will find reverse of given number"
	echo "       For eg. $0 123, I will print 321"
	exit 1
fi

n=$1
rev=0
sd=0

while [[ $n -gt 0 ]]; do
	sd=`expr $n % 10`
	rev=`expr $rev \* 10 + $sd`
	n=`expr $n / 10`
done
	echo "Reverse number is $rev"
#
# ch.sh: vivek-tech.com to nixcraft.com reference converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#
