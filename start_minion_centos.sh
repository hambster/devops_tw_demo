#!/bin/bash
http_port=$(expr $2 + 1)
https_port=$(expr $2 + 2)
new_ssh_port=$(expr $2 + 3)
docker run --name $1 -p $2:22 -p $http_port:80 -p $https_port:443 -p $new_ssh_port:2222  --link salt-master -h $1 -d salt-minion-centos
