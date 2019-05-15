#!/bin/bash

#-----------------------------------------------------------------------------#
# /sbin/lidevent                                                              #
# simple script to turn the display on or off when laptop lid is closed       #
# By Mahram Z.Foadi                                                           #
# Oct 22 2005                                                                 #
# thank you linuxquestions.org                                                #
#                                                                             # 
# the following lines must be present in your "/etc/acpi/events/" files. Some #
# systems already have a file called sample.conf in the mentioned directory   #
# rename it to something more meaningful (i.e. acpid.conf) and these lines to #
# the end of it  (you don't HAVE to rename it, you can even create a new file #
# and call it /etc/acpi/events/lid.conf with the 2 lines in it. If you intend #
# to put this file anywhere other than /sbin/lidevent, make sure you make the #
# proper changes in the "action" line below. For example if you are going to  #
# save this script as /usr/bin/mylid.sh then the action line should be:       #
# action=/usr/bin/mylid.sh                                                    #
# be sure both files are executable, writable, and owned by root ONLY because #
# the acpid daemon is most likely running as root in your system              #
#                                                                             #
#     ---- insert the two lines below in /etc/acpi/events/acpid.conf ----     #
# event=button/lid.*                                                          #
# action=/sbin/lidevent                                                       #
#-----------------------------------------------------------------------------#

# default display on current host
DISPLAY=:0.0

# find out if DPMS is enabled
STATUS=`xset -display $DISPLAY -q | grep -e 'DPMS is'`

# enable DPMS if disabled
if [ "$STATUS" == "  DPMS is Disabled" ]
then
	echo "Enabling DPMS ..."
	xset -display $DISPLAY +dpms
fi

# find out if monitor is on
STATUS=`xset -display $DISPLAY -q | grep 'Monitor'`

if [ "$STATUS" == "  Monitor is On" ]
then
i3lock -c 000000
	echo "[`date`] Turning display OFF"
	xset -display $DISPLAY dpms force off
else
	echo "[`date`] Turning display ON"		# shows up in log
	xset -display $DISPLAY dpms force on		# turn monitor on
	xset -display $DISPLAY s activate		# un-blank monitor
fi

#clean up
unset STATUS

# comment this line out if you're manually running this script from a shell (put a # in front of it)
unset DISPLAY

exit 0
export DISPLAY=:0;xset dpms force suspend &

