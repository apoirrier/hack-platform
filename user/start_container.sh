#!/bin/bash
docker build -t user .
docker run -d --net=hack_user_net --ip 192.168.42.42 --cap-add=NET_ADMIN --name user user
docker exec -it user ip route add 192.168.23.0/24 via 192.168.42.2
