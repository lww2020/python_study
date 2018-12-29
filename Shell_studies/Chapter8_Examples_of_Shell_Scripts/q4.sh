#!/bin/bash
#
:<<EOF
Q.4. Write Script, using case statement to perform basic math operation as
follows
+ addition
- subtraction
x multiplication
/ division
The name of script must be 'q4' which works as follows
$ ./q4 20 / 3, Also check for sufficient command line arguments
EOF

# Linux Shell Scripting Tutorial 1.05r3, Summer-2002
#
# Writen by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixcraft.com/
#
# Q4
#
 if [[ $# -eq 3 ]]; then
 	case $2 in
 		+ ) let z=$1+$3
 			;;
 		- ) let z=$1-$3
			;;
		x/X ) let z=$1*$3
			;;
		/ ) let z=$1/$3
			;;
		* ) echo "Warning - $2 invalied operation, only +, -, x, / operation allowed"
			exit
			;;
 	esac
 	echo Answer is $z
 else
 	echo "Usage - $0 value1 operator value2"
 	echo "        where , value1 and value2 are numberic values "
 	echo "                 operator can be +, -, x, / (For multiplication)"
 fi

 #
 # ./ch.sh: vivek-tech.com to nixcraft.com reference coverted using this tool
 # See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
 #
