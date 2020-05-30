#!/bin/bash
export LANG=en_US.UTF-8
export LOCALE=UTF-8

/usr/bin/gsettings get org.mate.background picture-filename  |head -1 | xargs /usr/bin/eom

