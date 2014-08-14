#!/bin/bash
#
#startup.sh

service ssh start

#add ip
sed -i "s/master_ip/$(hostname -i)/" $HADOOP_PREFIX/etc/hadoop/core-site.xml

bin/hdfs namenode -format

sbin/start-dfs.sh
