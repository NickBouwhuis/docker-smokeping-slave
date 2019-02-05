FROM debian:latest
# Run with --hostname for pretty hostnames, or not, I'm a Dockerfile not a cop

RUN apt update \
	&& apt install -y smokeping liblwp-protocol-https-perl dnsutils \
	&& mkdir /var/smokeping \
	&& SECRET=$(openssl rand -base64 32) \
	&& echo $SECRET >> secret.txt \
	&& chmod 600 secret.txt \
	&& echo Generated the following secret: $SECRET

CMD echo If you haven't already done so, add the following to your smokeping master, then run the container again \
	&& echo Hostname: $HOSTNAME \
	&& echo String for smokeping_secrets: $HOSTNAME:$(cat secret.txt) \
	&& smokeping --master-url=https://vps.0x5e.eu/cgi-bin/smokeping.cgi --cache-dir=/var/smokeping --shared-secret=secret.txt --nodaemon