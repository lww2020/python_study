#!/bin/bash
#
# Linux Shell Script Tutorial 1.05r3, Summer-2002
#
# Written by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com/
#
# Q11

if [[ $# -ne 1 ]]; then
	echo "Usage - $0 file_name"
	exit 1
fi

if [[ -f $1 ]]; then
	echo "$1 file exists"
else
	echo "Sorry, $1 file does not exists"
fi

#
# ./ch.sh: vivek-tech.com to nixcraft.com referance converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#