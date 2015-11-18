#!/bin/sh -x

sudo ifconfig eth6 192.168.6.1 up
sudo ifconfig eth4 192.168.5.1 up

sudo tc qdisc add dev eth4 root tbf rate 15mbit burst 100kb latency 70ms
sudo tc qdisc add dev eth6 root tbf rate 20mbit burst 100kb latency 70ms
