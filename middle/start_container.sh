#!/bin/sh
docker build -t middle .
docker run -d --net=hack_user_net --ip 192.168.42.2 --name middle middle
docker network connect --ip 192.168.23.2 hack_dns_net middle
