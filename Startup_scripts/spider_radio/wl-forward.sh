#!/bin/sh -x

IPADD=10.3.0.3
NETWORK=10.3.0.0
INTERNAL=eth0
EXTERNAL=tun0
echo $IPADD


ip link set dev $INTERNAL down
ip link set dev $INTERNAL up
ip addr add $IPADD/24 dev $INTERNAL
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o $EXTERNAL -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $INTERNAL -o $EXTERNAL -j ACCEPT
#dhclient eth0
