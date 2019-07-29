#!/bin/bash
DATE=`date +%Y-%m-%d`
cd /home/joop/syncthing-phone/gtd
/usr/bin/git add /home/joop/syncthing-phone/gtd/
/usr/bin/git commit -m "commit $DATE" /home/joop/syncthing-phone/gtd/
