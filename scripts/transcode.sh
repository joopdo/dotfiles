#!/bin/bash

# Transcode a list of video files to mp4/h.264
# The result is output in-place and a .old suffix is added to input video file 

hbcli=/usr/bin/HandBrakeCLI
mi=/usr/bin/mediainfo

declare out_file

if [ -z "$1" ]
then
    echo "Usage: $(basename $0) Filename"
    echo ""
    echo "An input file can be created using find"
    echo "eg. find /home/dimitry/Videos/ -name *.avi | sort > video_list.txt"    
    exit 0
fi

trap on_exit SIGINT SIGQUIT SIGHUP SIGTERM

function on_exit() {
    echo "aborted"
    rm -f "$out_file"
    exit 1
}

while read in_file
do
    if [ -f "$in_file" ]
    then
        echo "Processing…"
        echo ">Input $in_file"

        # remove file extension
        base_file=$(echo "$in_file" | sed 's/\(.*\)\..*/\1/')

        out_file="$base_file.mp4.tmp"
        
        echo ">Output $out_file"

        # encode file
        echo "" | $hbcli -i "$in_file" -o "$out_file" --preset="AppleTV 3"

        # check output is valid
        if $mi "$out_file" | grep -q "Format[ ]*: AVC"
        then
            mv "$out_file" "$base_file.mp4"
            mv "$in_file" "$in_file.old"
        else
            rm -f "$out_file"
            echo "$in_file had problems" >> "$(basename $0).log"
        fi

        echo ">Finished $in_file"
    fi
done < $1
