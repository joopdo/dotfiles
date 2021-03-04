#!/bin/bash -e

PRIMARY="eDP-1"
EXT1="HDMI-1"
EXT2="DVI-I-1-1"

if (xrandr | grep "$EXT1 connected"); then
#    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --rotate normal --auto --output $EXT1 --auto --right-of $PRIMARY
    xrandr --output $PRIMARY --primary --auto --rotate normal --output $EXT2 --auto --right-of $EXT1
    echo "second screen (DOCK) enabled"
elif (xrandr | grep "$EXT2 connected"); then
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto --rotate normal --output $EXT2 --auto --right-of $PRIMARY
    echo "second screen (VGA) enabled"
else
    xrandr --output $EXT1 --off
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --rotate normal --auto
    echo "second screen disabled"
fi
