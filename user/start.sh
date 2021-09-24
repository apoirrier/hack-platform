#!/bin/bash

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "Europe/Paris" > /etc/timezone
apt update && apt install -y tcpdump iproute2 dnsutils
ip route add 192.168.23.0/24 via 192.168.42.2
sleep infinity
