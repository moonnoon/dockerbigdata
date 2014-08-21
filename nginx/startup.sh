#!/bin/bash
#
#startup.sh

#run
mkdir -p /data/log/
cp -a /var/log/nginx/ /data/log/

nginx
