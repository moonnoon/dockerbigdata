#!/bin/bash
#
#startup.sh

export ZK_IP=$(cat /etc/hosts | grep zookeeper | cut -f1)

sed -i "s/zookeeper_ip/$ZK_IP" /opt/storm/examples/storm-starter/src/jvm/storm/starter/Test.java

#run
/opt/storm/bin/storm jar target/storm-starter-0.9.2-incubating-jar-with-dependencies.jar storm.starter.Test
