#!/bin/bash
nohup tor &
export all_proxy=socks5://localhost:9050
/usr/local/bin/syncthing

