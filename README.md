# Hacking platform for DNS hijacking

This project lets students connect to a middle box between a user and a DNS server to try to implement DNS hijacking.

## Network configuration

The platform is composed of 3 Docker containers: `dns`, `middle` and `user`.

`dns` is a DNS server whose IP is 192.168.23.23.
It answers all DNS queries, with an additional entry for `perdu.fr` whose answer is 23.23.23.23.
It is in the `hack_dns_net` network whose range is 192.168.23.0/24.

`middle` has 2 interfaces, it is between the DNS and user containers.
All traffic between those two is routed via `middle`.
The `hack_dns_net` interface has IP 192.168.23.2 and the `hack_user_net` interface has IP 192.168.42.2.

`user` is a user.
You can make DNS queries from it with `dig @192.168.23.23 mysite.com`.

## How to use

Launch the containers using `./start_simulation.sh`.

You can connect to a box using `docker exec -it name /bin/bash` by replacing `name` with the name of the box.

## ToDo

- redo the configuration using docker-compose to have a simpler configuration
- create a real client sending regular DNS queries and sending some http query with flag using the answer
- allow direct SSH connection to the middle box