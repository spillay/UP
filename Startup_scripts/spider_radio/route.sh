#!/bin/sh -x

IP=192.168.5.101
GW=192.168.5.1
NET=192.168.5.0
INT=wlan1

#IP=196.248.107.122
#GW=196.248.96.1
#NET=196.248.96.0
#INT=wlan0

ip route add $NET/24 dev $INT src $IP table rt2
ip route add default via $GW dev $INT table rt2

ip rule add from $IP/32 table rt2
ip rule add to $IP/32 table rt2

