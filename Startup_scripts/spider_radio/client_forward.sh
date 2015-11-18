#!/bin/sh -x

sudo route del default gw 192.168.6.1
sudo route add default gw 10.3.0.1

sudo iptables -A FORWARD  -s 192.168.0.0/24 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

