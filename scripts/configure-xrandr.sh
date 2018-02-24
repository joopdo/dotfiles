#!/bin/bash -e

PRIMARY="eDP1"
EXT1="HDMI1"
EXT2="VGA-0"

if (xrandr | grep "$EXT1 connected"); then
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto --output $EXT1 --auto --left-of $PRIMARY
    echo "second screen (DOCK) enabled"
elif (xrandr | grep "$EXT2 connected"); then
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto --output $EXT2 --auto --left-of $PRIMARY
    echo "second screen (VGA) enabled"
else
    xrandr --output $EXT1 --off
    xrandr --output $EXT2 --off
    xrandr --output $PRIMARY --primary --auto
    echo "second screen disabled"
fi
