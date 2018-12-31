#!/bin/bash
:<<eof
Q.10.How to perform real number calculation in shell script and store result to
third variable , lets say a=5.66, b=8.67, c=a+b?
eof
#
# Linux Shell Script Tutorial 1.05r3, Summer-2002
#
# Written by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can ben found at http://www.nixcraft.com/
#
# Q10
#
a=5.66
b=8.67
c=`echo $a + $b | bc`
echo "$a + $b = $c"

#
# ./ch.sh: vivek-tech.com to nixcraft.com referance converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#