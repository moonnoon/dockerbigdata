#!/bin/bash
#
#sudo remove.sh

docker rmi -f moonnoon/data:testing
docker rmi -f moonnoon/base:testing
docker rmi -f moonnoon/zookeeper:testing
docker rmi -f moonnoon/kafka:testing
docker rmi -f moonnoon/flume:testing
docker rmi -f moonnoon/appflume:testing
docker rmi -f moonnoon/hadoop:testing
docker rmi -f moonnoon/elasticsearch:testing
docker rmi -f moonnoon/storm:testing
