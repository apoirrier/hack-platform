#!/bin/bash

apt update && apt install -y dnsmasq tcpdump iproute2
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "23.23.23.23 perdu.fr" >> /etc/additional_hosts
echo "user=root" >> /etc/dnsmasq.conf
ip route add 192.168.42.0/24 via 192.168.23.2
dnsmasq -k -H /etc/additional_hosts
