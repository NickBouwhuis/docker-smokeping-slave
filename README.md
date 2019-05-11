# Docker Smokeping Slave
Easily deploy a Smokeping slave with Docker and this one weird trick!

## Steps to deploy
Here we go!
1. Generate a secure secret (You could use `apg -n 1 -m 16`) and think of a hostname.
2. Edit your smokeping_secrets file on the master and reload it.
3. Edit and run this on your docker host.
```
docker run -d --rm nullr0ute/docker-smokeping-slave --hostname myawesomeslave -e "secret=lamesecret" -e "master=https://my.docker.host/cgi-bin/smokeping.cgi"
```
4. ???
5. Profit!
