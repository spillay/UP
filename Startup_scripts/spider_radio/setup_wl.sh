#!/bin/sh -x 
wpa_supplicant -i wlan0 -c wpa_5g.conf &
wpa_supplicant -i wlan1 -c wpa_sp.conf &

dhclient wlan0
dhclient wlan1

sleep 4

./route.sh
./route2.sh

sudo ifconfig eth0 192.168.0.1 up

