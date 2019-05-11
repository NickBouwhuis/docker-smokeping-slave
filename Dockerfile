FROM debian:latest

RUN apt-get update \
	&& apt-get install -y smokeping liblwp-protocol-https-perl dnsutils \
	&& mkdir /var/smokeping

CMD echo $secret >> secret.txt \
	&& chmod 600 secret.txt \
	&& echo String for smokeping_secrets: $HOSTNAME:$(cat secret.txt) \
	&& smokeping --master-url=$master --cache-dir=/var/smokeping --shared-secret=secret.txt --nodaemon
