#!/bin/sh -x

sudo ifconfig eth0 10.5.5.3 netmask 255.255.255.0 up
sudo route add default gw 10.5.5.2

