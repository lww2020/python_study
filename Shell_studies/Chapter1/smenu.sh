#!/bin/bash
#
# How to create small menu using dialog
#
dialog --backtitle "Linux Shell Script Tutorial" --title "Main Menu" --menu "Move using [UP] [DOWN], [Enter] to Select" 15 50 3\
Date/time "shows Date and Time"\
Calendar "To see calendar "\
Editor "To start vi editor" 2>/tmp/menuitem.$$

menuitem=`cat /tmp/menuitem.$$`

opt=$?

case $memuitem in 
    Date/Time ) date ;;
    Calendar ) cal ;;
    Editor ) vi ;;
esac
