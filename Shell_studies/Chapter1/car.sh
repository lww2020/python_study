#!/bin/bash
#
# if no vehicle name is given
# i.e. -z $1 is defined and it is NULL
#
# if no command line arg

if [ -z $1 ]; then
    rental="*** Unkown vehicle ***"
elif [ -n $1 ]; then
# otherwise malke first arg as rental
    rental=$1
fi

case $rental in 
    "car") echo "For $rental Rs.20 per k/m";;
    "van") echo "For $rental";;
    "jeep") echo "For $rental Rs.5 per k/m";;
    "bicycle") echo ""
esac
