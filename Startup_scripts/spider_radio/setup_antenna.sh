#!/bin/sh -x 

ifconfig eth4 192.168.5.4
ifconfig eth5 192.168.6.4

sudo tc qdisc add dev eth4 root tbf rate 15mbit burst 100kb latency 70ms
sudo tc qdisc add dev eth5 root tbf rate 20mbit burst 100kb latency 70ms

./route.sh
./route2.sh

