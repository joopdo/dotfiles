#!/bin/sh
#sudo su
cpufreqctl --governor --set=performance
route add 192.168.2.200 gw 192.168.1.1 enp0s31f6  
