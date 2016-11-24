#!/bin/bash
docker run --name salt-master -d -p 2222:22 -h salt-master salt-master
