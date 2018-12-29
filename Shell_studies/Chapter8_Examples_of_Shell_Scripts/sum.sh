#!/bin/bash
#
# Linux Shell Script Tutorial 1.05r3, Summer-2002
#
# Written by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com/
#
# Q1.Script to sum to nos

if [[ $# -ne 2 ]]; then
	echo "Usage - $0 x y"
	echo "        where x and y are two nos for which I will print sum"
	exit 1
fi
	echo "Sum of $1 and $2 is `expr $1 + $2`"
#
# ./ch.sum: Vivek-tech.com to nixcraft.com references converted using this tool
# See the tool at http://www.nixcrafted.com/uniqlinuxfeatures/tools/
#