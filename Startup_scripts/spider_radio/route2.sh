#!/bin/sh -x

IP=192.168.6.2
GW=192.168.6.1
NET=192.168.6.0
INT=wlan0

#IP=196.248.107.122
#GW=196.248.96.1
#NET=196.248.96.0
#INT=wlan0

ip route add $NET/24 dev $INT src $IP table rt1
ip route add default via $GW dev $INT table rt1

ip rule add from $IP/32 table rt1
ip rule add to $IP/32 table rt1

