#!/bin/sh -x

sudo ifconfig eth0 10.5.5.1 netmask 255.255.255.0 up
sudo ifconfig eth3 10.5.5.2 netmask 255.255.255.0 up


sudo ./wl-setforward.sh
sudo ./wl-setforward-eth3.sh
