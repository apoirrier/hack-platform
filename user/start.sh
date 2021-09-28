#!/bin/bash

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "Europe/Paris" > /etc/timezone
apt update && apt install -y tcpdump iproute2 dnsutils iptables wget
ip route add 192.168.23.0/24 via 192.168.42.2
echo "nameserver 192.168.23.23" > /etc/resolv.conf
iptables -A OUTPUT -j DROP -d 23.23.23.23
while true
do
	wget --connect-timeout=1 --tries=1 http://perdu.fr?flag=$FLAG
	sleep 1
done
