# Configuration Management with SaltStack Demo in DevOps Taiwan Meetup

## Overview

repo for demo in DevOps Taiwan Meetup.

## Slides/Documents

* `Demo/demo.md`: rough document for [demo](Demo/demo.md)

## Data of Docker for Demo

* `master`: directory contains docker file and build script to build master
* `minion`: directory contains docker file and build script to build minion
* `minion_centos`: directory contains docker file and build script to build CentOS minion

## SSH Keys

* `ssh`: SSH public/private keys to connect demo containers

## Scripts

* ssh2master.sh: ssh to demo master
* ssh2minion.sh: ssh to demo minion
* start\_master.sh: start salt-master container
* start\_minion.sh: start salt-minion container
    * arg1: name of the container
    * arg2: port of the SSH listening port of minion container
* start\_minion\_centos.sh: start salt-minion as CentOS 7
    * arg1: name of the container
    * arg2: port of the SSH listening port of minion container
