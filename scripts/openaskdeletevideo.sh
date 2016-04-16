#!/bin/bash


find . -iname "*.mkv" -o  -iname  "*.mp4"  -size +512k  -print0 | while IFS= read -r -d '' file; do
	echo '%s\n' "$file"

smplayer "$file" 2>/dev/null
read -p "remove this video? (y/n)?" choice < /dev/tty
case "$choice" in 
  y|Y ) mv "$file" /home/suna/oldvideo/;;
  n|N ) echo "no";;
  * ) echo "next";;
esac



done
