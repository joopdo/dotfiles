#!/bin/sh
xmodmap -e 'keycode 66 = BackSpace' -e 'clear Lock'
setxkbmap us -variant colemak
