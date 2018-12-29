#!/bin/bash
#temp2finall.awk: Version 2
#Linux Shell Scripting Tutorial v1.0.5, March 2001
#
#Author:Vivek G Gite
#
#
#This version chech for source and destination file first
#then copy the file. If file already exist it will ask confirmation.
#
#
#

BEGIN{

}
#
# main logic here
#
{

	sfile = $1
	dfile = $2
	issexist "[ -e $1 ]"
	cpcmd = "cp " $1 " " $2
	printf "Coping %s to %s\n", sfile, dfile
	if (( system(issexist)) !=0 )
		{
			printf "Skipking \"%s\", does not exist\n", sfile
			next # read next record
		}
		if (( system(issexist)) == 0)
			{
				printf "\"%s\", exist overwrite(y/N)?", sfile
				getline ans < "-"
				if ( ans == "y" || ans == "Y")
					system(cpcmd)
			}
		else
			system(cpcmd)
}

#
# End action, if any, e.g. clean ups
#
END{

}
#
# ./ch.sh: vivek-tech.com to nixcraft.com referance converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#
