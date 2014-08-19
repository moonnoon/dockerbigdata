#!/bin/bash
#
#sudo ./build.sh

docker build -t moonnoon/data:testing ./data/
docker build -t moonnoon/base:testing ./base/
docker build -t moonnoon/zookeeper:testing ./zookeeper/
docker build -t moonnoon/kafka:testing ./kafka/
docker build -t moonnoon/flume:testing ./flume/
docker build -t moonnoon/appflume:testing ./appflume/
docker build -t moonnoon/hadoop:testing ./hadoop
docker build -t moonnoon/elasticsearch:testing ./elasticsearch/
docker build -t moonnoon/storm:testing ./storm/
