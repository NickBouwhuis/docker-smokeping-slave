FROM debian:latest

RUN apt update \
	&& apt install -y smokeping liblwp-protocol-https-perl dnsutils \
	&& mkdir /var/smokeping \
	&& echo $secret >> secret.txt \
	&& chmod 600 secret.txt \

CMD echo If you have not already done so, add the following to your smokeping master, then run the container again \
	&& echo Hostname: $HOSTNAME \
	&& echo String for smokeping_secrets: $HOSTNAME:$(cat secret.txt) \
	&& smokeping --master-url=$master --cache-dir=/var/smokeping --shared-secret=secret.txt --nodaemon