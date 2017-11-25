#!/bin/sh
while read line; do
IPz="$(echo $line | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])' --line-buffered)"
DEVICEN="$(cat /var/lib/misc/dnsmasq.leases | grep $IPz --line-buffered |  sed 's/[^ ]* //' | sed 's/[^ ]* //'  | sed 's/[^ ]* //' | sed 's/\s.*$//')"

	kodi-send -a "Notification($DEVICEN,$line)"
done
