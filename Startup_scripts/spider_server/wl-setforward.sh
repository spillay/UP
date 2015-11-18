#!/bin/sh -x

IPADD=192.168.1.102
NETWORK=192.168.1.0
INTERNAL=tun0
EXTERNAL=eth0
echo $IPADD


ip link set dev $INTERNAL down
ip link set dev $INTERNAL up
ip addr add $IPADD/24 dev $INTERNAL
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o $EXTERNAL -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $INTERNAL -o $EXTERNAL -j ACCEPT
#dhclient eth0
