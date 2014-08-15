#!/bin/bash
#
#startup.sh

sed -i "s/zookeeper_ip/$(cat /etc/hosts | grep zookeeper | cut -f1)/" /opt/storm/examples/storm-starter/src/jvm/storm/starter/Test.java

mvn package

#run
/opt/storm/bin/storm jar target/storm-starter-0.9.2-incubating-jar-with-dependencies.jar storm.starter.Test
