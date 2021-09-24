#!/bin/bash
docker network create --subnet=192.168.23.0/24 hack_dns_net
cd dns && ./start_container.sh && cd ..

# This we possibly need to create a lot of them
docker network create --subnet=192.168.42.0/24 hack_user_net
cd user && ./start_container.sh && cd ..
cd middle && ./start_container.sh && cd ..
