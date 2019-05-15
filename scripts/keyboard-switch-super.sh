#!/bin/bash
setxkbmap -v us -variant 'colemak' -option "caps:backspace, altwin:swap_alt_win"
localectl set-x11-keymap 'colemak'
#setxkbmap -option caps:escape &

#	#setxkbmap -v us -variant colemak -option "caps:backspace"
usbkbd=`xinput -list | grep -c "Apple Inc. Apple Internal Keyboard / Trackpad"`
if [[ "$usbkbd" -gt 0 ]]
then
    usbkbd_ids=`xinput -list | grep "Apple Inc. Apple Internal Keyboard / Trackpad" | awk -F'=' '{print $2}' | cut -c 1-2`
    usbkbd_layout="tr(f)"
    for ID in $usbkbd_ids
    do
		
#setxkbmap -device 13 -v us -variant colemak -option

echo $ID
setxkbmap -device "$ID" -v us -variant 'colemak' -option

#"caps:backspace, altwin:swap_alt_win"
#		echo	setxkbmap -device "{$ID}" -keymap colemak -option altwin:swap_alt_win
	
#setxkbmap -device "{$ID}" -keymap colemak -option altwin:swap_alt_win
	done
fi
exit 0
