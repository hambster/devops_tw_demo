#!/bin/bash
ssh -p $1 -i ssh/id_rsa_demo -o StrictHostKeyChecking=no root@127.0.0.1
