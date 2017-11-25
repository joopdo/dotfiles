tail  -n 10 -f /home/joop/dnslog.log | grep -v 192.168.2.1 --line-buffered| grep query  --line-buffered  | stdbuf -oL awk '{print substr($0,40)}' | xargs /home/joop/kodi-notify.sh 

