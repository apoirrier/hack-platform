#!/bin/bash
cd dns && ./stop_container.sh && cd ..
cd user && ./stop_container.sh && cd ..
cd middle && ./stop_container.sh && cd ..

docker network rm hack_dns_net
docker network rm hack_user_net
