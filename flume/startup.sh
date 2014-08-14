#!/bin/bash
#
#startup.sh

export ZK_IP=$(cat /etc/hosts | grep zookeeper | cut -f1)
export HADOOP_IP=$(cat /etc/hosts | grep hadoop | cut -f1)
export ES_IP=$(cat /etc/hosts | grep elasticsearch | cut -f1)

sed -i "s/zookeeper_ip/$ZK_IP" /opt/flume/conf/flume-conf.properties
sed -i "s/elasticsearch_ip/$ES_IP" /opt/flume/conf/flume-conf.properties
sed -i "s/namenode_ip/$HADOOP_IP" /opt/flume/conf/flume-conf.properties


#run
bin/flume-ng agent --conf conf --conf-file conf/flume-conf.properties --name consumer -Dflume.root.logger=INFO,console
