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
It continously performs http queries to perdu.fr, with a flag parameter set by an environment variable.

## Requirements

You need docker-compose to be installed.
Also you may need to install the .deb package included on the host, though I can't remember why.

## How to use

Launch the containers using `docker-compose up -d`.

A student can connect to the middle box via SSH, using `ssh student@<ip_of_host> -p 2322`, password is `Hellothere`.
Try to see packets with `tcpdump port 53`, you should be able to see the queries made by the user.

The goal of the exercise is for the student to mount a DNS hijacking attack on the middle box.
That way they can redirect traffic to perdu.fr to the middle box.
To test it, you can start an http server on the middle box with `python3 -m http.server 80`.
Then make a query from the user using `docker exec -it user wget http://192.168.42.2?flag=$FLAG`.
You should see the flag appear on the middle box log.

Stop all containers with `docker-compose down`.

## ToDo

- create configuration for multiple students and generate flags dynamically.
