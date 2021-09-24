#!/bin/bash

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "Europe/Paris" > /etc/timezone
apt update && apt install -y tcpdump iproute2 dnsutils
sleep infinity
