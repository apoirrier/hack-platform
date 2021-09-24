FROM ubuntu

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "Europe/Paris" > /etc/timezone
RUN apt update && apt install -y tcpdump iproute2 dnsutils

ENTRYPOINT ["sleep", "infinity"]
