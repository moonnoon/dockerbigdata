#!/bin/bash
#
#startup.sh

export KAFKA_IP=$(cat /etc/hosts | grep kafka | cut -f1)

sed -i "s/kafka_ip/$KAFKA_IP" /opt/flume/conf/flue-conf.properties

#run
bin/flume-ng agent --conf conf --conf-file conf/flume-conf.properties --name producer -Dflume.root.logger=INFO,console
