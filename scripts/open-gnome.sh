#!/bin/bash
export LANG=en_US.UTF-8
export LOCALE=UTF-8

/usr/bin/gsettings get org.gnome.desktop.background picture-uri |head -1 | xargs /usr/bin/eom



