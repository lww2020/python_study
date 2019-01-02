#!/bin/bash
:<<eof
Q.15. Write script called sayHello, put this script into your startup file called .bash_profile, the script should run as soon as you logon to system, and it print any one of the following message in infobox using dialog utility, if installed in your system, If dialog utility is not installed then use echo statement to print message : -
Good Morning
Good Afternoon
Good Evening , according to system time.
eof

#
# Linux Shell Script Tutorial 1.05r3, Summer-2002
#
# Written by Vivek G. Gite <vivek@nixcraft.com>
#
# Latest version can be found at http://www.nixctraft.com/tools/
#
# Q15
#

temph=` date | cut -c17-18`
dat=`date +"%A %d in %B of %Y (%r)"`

if [ $temph -lt 12 ]; then
	mess="Good Morning $LOGNAME, Have a nice day!"
fi

if [ $temph -gt 12 -a $temph -le 16 ]; then
	mess="Good Afternoon $LOGNAME"
fi

if [ $temph -gt 16 -a $temph -le 18 ]; then
	mess="Good Evening $LOGNAME"
fi

if which dialog > /dev/null ; then
	dialog --backtitle "Linux Shell Script Tutorial "\
	--title "{-: Welcome to Linux :-}" \
	--infobox "\n$mess\nThis is $dat" 6 60
	echo -n "                           Press a key to continue..."
	read
	clear
else
	echo -e "$mess\nThis is $dat" 
fi

#
# ./ch.sh: vivek-tech.com to nixcraft.com referance converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#
