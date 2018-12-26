#!/bin/bash
#
# Signal is trapped to delete temporary file, version 2
#
del_file()
{
    echo "* * * CTRL + C Trap Occurs (removing temporary file) * * *"
    rm -f /tmp/input0.$$
    exit 1
}

Take_input1()
{
    recno=0
    clear
    echo "Appointment Note keepter for Linux"
    echo -n "Enter your database file name : "
    read filename
    if [ ! -f $filename ]; then
        echo "Sorry, $filename does not exit, Creating $filename database"
        echo "Appointment Note keepter Appoint database file" > $filename
    fi
    echo "Data entry start data: `date`" >/tmp/input2.$$
    #
    # Set a infinite loop
    #
    while :
    do
        echo -n "Appointment Title:"
        read na
        echo -n "time :"
        read ti
        echo -n "Is data okey(y/n) ?"
        read ans
        if [ $ans = y -o $ans = Y ]; then
            recno=`expr $recno + 1`
            echo "$recno. $na $ti $remark" >> /tmp/input2.$$
        fi
        echo -n "Add next appointment(y/n)?"
        read isnext
        if [ $isnext = n -o $isnext = N ]; then
           cat /tmp/input2.$$ >> $filename
           rm -f /tmp/input2.$$
           return # terminate loop
        fi
    done # end_while
}
#
# Set trap to for CTRL+C interrupt i.e. Install our error handler
# When occurs it first it calls del_file() and then exit
#
trap del_file 2
#
# Call our user define function : Take_input1
#
Take_input1