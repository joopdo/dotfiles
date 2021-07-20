#!/bin/bash -e

PRIMARY="eDP-1"

    xrandr --output $PRIMARY --primary --rotate normal --auto
    echo "second screen disabled"
