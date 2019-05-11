FROM debian:latest

RUN apt-get update \
	&& apt-get install -y smokeping liblwp-protocol-https-perl dnsutils \
	&& mkdir /var/smokeping

ADD entrypoint.sh /opt/entrypoint.sh

CMD ["/bin/bash", "/opt/entrypoint.sh"]
