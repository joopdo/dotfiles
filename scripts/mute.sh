#!/bin/bash

#CURRENT_STATE=amixer -c 2 get Mic | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'

#echo $CURRENT_STATE


#if [[ $CURRENT_STATE == '[on]' ]]; then
if amixer -c 2 get Mic | grep -q  "\[on\]"
then
    	amixer -c 2 set Mic nocap
	notify-send Muted
else
    amixer -c 2 set Mic cap
     notify-send Unmuted.
fi
