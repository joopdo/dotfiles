#!/bin/bash
/usr/bin/dhcpcd

ifconfig wlp2s0 down
iptables -t nat -A POSTROUTING -o 0enp0s20f0u1u4 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i net0 -o  enp0s20f0u1u4 -j ACCEPT
sudo create_ap wlp2s0 enp0s20f0u1u4 "Dr. Panda's 5Ghz - no privacy" chengdupanda
