#!/bin/bash
#
for (( i = 1; i <= 9; i++ )) ### Outer for loop ###
do
	for (( j = 1; j <=9; j++ )) ### Inner for loop ###
	do
		tot=`expr $i + $j`
		tmp=`expr $tot % 2`
		if [ $tmp -eq 0 ]; then
			echo -e -n "\033[47m "
		else
			echo -e -n "\033[40m "
		fi
	done
	echo -e -n "\033[40m" #### set back backgroup colour to black
	echo " " #### print a new line ###

done