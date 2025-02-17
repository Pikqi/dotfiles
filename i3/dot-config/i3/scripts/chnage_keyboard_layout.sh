#!/bin/bash

LAYOUT=`setxkbmap -print -verbose 10 | grep layout | awk '{print $2}'`
VARIANT=`setxkbmap -print -verbose 10 | grep variant | awk '{print $2}'`

TITLE=Keyboard layout changed

echo $VARIANT

if [ x$LAYOUT = xus ];then
	setxkbmap rs latin
	notify-send $TITLE "Serbian Latin"
	exit
fi

if [ x$VARIANT = xlatin ];then
	setxkbmap rs alternatequotes 
	notify-send $TITLE "Serbian Cyrilic"
	exit
fi

setxkbmap us euro
notify-send $TITLE "US EN"

