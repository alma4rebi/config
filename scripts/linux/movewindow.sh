#! /bin/bash

offx=$( grep metamodes /etc/X11/xorg.conf | cut -d '+' -f 4 | sed 's/[^0-9]*//g' )
offy=$( grep metamodes /etc/X11/xorg.conf | cut -d '+' -f 5 | sed 's/[^0-9]*//g' )
curx=$(xwininfo -id `xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| cut -d ' ' -f 5` | grep "Absolute upper-left X" | cut -d ' ' -f 7)
cury=$(xwininfo -id `xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| cut -d ' ' -f 5` | grep "Absolute upper-left Y" | cut -d ' ' -f 7)

if [ $curx -ge $offx ]
then
    newx=$((curx-offx))
    newy=$((cury-offy - 29 ))
else
    newx=$((curx+offx))
    newy=$((cury+offy - 29))
fi

/usr/bin/xdotool windowmove `/usr/bin/xdotool getwindowfocus` $newx $newy

exit 0


#!/bin/bash
#
#if [ $1 -eq 2 ]
#then
#    POS="1915 0"
#else
#    POS="61 0"
#fi
#
#xdotool windowmove `/usr/bin/xdotool getwindowfocus` $POS
#
#exit 0
