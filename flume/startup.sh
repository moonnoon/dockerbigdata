#!/bin/bash
#
#startup.sh

export KAFKA_IP=
export ZK_IP=

#configure
sed -i -e"s/^producer.sources.s.type\s*=\s*seq/producer.sources.s.type = netcat/" flume/conf/flume-conf.properties
sed -i -e'/type = netcat/a producer.sources.s.bind = 0.0.0.0\nproducer.sources.s.port = 44444' flume/flume-conf.properties
sed -i -e"s/^producer.sinks.r.metadata.broker.list\s*=\s*127.0.0.1:9092/producer.sinks.r.metadata.broker.list=$KAFKA_IP:9092/" flume/flume-conf.properties
sed -i -e"s/^consumer.sources.s.zookeeper.connect\s*=\s*127.0.0.1:2181/consumer.sources.s.zookeeper.connect=$ZK_IP:2181/" flume/conf/flume-conf.properties

sed -i -e"s/^producer.sinks.r.custom.topic.name\s*=\s*kafkaToptic/producer.sinks.r.custom.topic.name=test/" flume/conf/flume-conf.properties
sed -i -e"s/^consumer.sources.s.custom.topic.name\s*=\s*kafkaToptic/consumer.sources.s.custom.topic.name=test/" flume/conf/flume-conf.properties

#run
bin/flume-ng agent --conf conf --conf-file conf/flume-conf.properties --name producer -Dflume.root.logger=INFO,console
