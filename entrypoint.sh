#!/bin/bash
echo Starting Smokeping Slave...
echo $secret >> secret.txt
echo String for smokeping_secrets: $HOSTNAME:$(cat secret.txt)
chmod 600 secret.txt
smokeping --master-url=$master --cache-dir=/var/smokeping --shared-secret=secret.txt --nodaemon