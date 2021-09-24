#!/bin/bash
docker build -t dns .
docker run -d --net=hack_dns_net --ip 192.168.23.23 --cap-add=NET_ADMIN --name dns dns
docker exec -it dns ip route add 192.168.42.0/24 via 192.168.23.2
