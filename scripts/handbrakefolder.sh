#!/bin/bash
#
# Change this to specify a different handbrake preset. You can list them by running: "HandBrakeCLI --preset-list"
#
PRESET="AppleTV 3"
if [ -z "$1" ] ; then
    TRANSCODEDIR="."
else
    TRANSCODEDIR="$1"
fi
    find "$TRANSCODEDIR"/* -type fi
# -exec bash -c 'HandBrakeCLI -i "$1" -o "${1%\.*}".mp4 --preset="$PRESET"' __ {} \;
