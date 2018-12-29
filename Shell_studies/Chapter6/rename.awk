#!/bin/bash
# Linux Shell Scripting Tutoring V1.05r3, Summer-2002
# rename.awk:awk script to rename file with some builtin Intelligence
# Author: Vivek G. Gite <vivek@nixcraft.com>
#
BEGIN {

}

#
# main logic is here
#
{
	isdir1 = "[ -d $1 ]"
	isdir2 = "[ -d $2 ]"

	scriptname = "up2low"
	awkscriptname = "rename".awk

	sfile = $1
	dfile = $2
	#
	# We are not suppose to rename dirs in source or destination
	#

	# make sure we are renaming our self if in same dir
	#
	if ( sfile == scriptname sfile == awkscriptname ) 
		next
	else if ((system(isdir1)) ==0 ) system((isdir2)) == 0 )
	{
		printf "%s or %s is directory can't rename it to lower case\n",sfile,dfile
		next # continue with next recored
	}
	else if (sfile == dfile)
	{
		printf "Skiping, \"%s\" is already in lowercase\n", sfile
		next
	}
	else # everything is okay rename it to lowercase
		{
			mvcmd = "mv" sfile " " dfile
			printf "Renaming %s to %s\n",sfile, dfile
			system(mvcmd)
		}
}

#
# End action, if any, e.g. clear ups
#
END {

}

#
# ./ch.sh: vivek-tech.com to nixcraft.com reference converted using this tool
# See the tool at http://www.nixcraft.com/uniqlinuxfeatures/tools/
#
