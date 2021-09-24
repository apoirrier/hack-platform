FROM ubuntu:latest

EXPOSE 53

RUN apt update && apt install -y dnsmasq tcpdump iproute2
RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
RUN echo "23.23.23.23 perdu.fr" >> /etc/additional_hosts
RUN echo "user=root" >> /etc/dnsmasq.conf

CMD ["dnsmasq", "-k", "-H", "/etc/additional_hosts"]
