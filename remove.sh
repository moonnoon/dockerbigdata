#!/bin/bash
#
#remove.sh

sudo docker rmi -f moonnoon/data:testing
sudo docker rmi -f moonnoon/base:testing
sudo docker rmi -f moonnoon/zookeeper:testing
sudo docker rmi -f moonnoon/kafka:testing
sudo docker rmi -f moonnoon/flume:testing
sudo docker rmi -f moonnoon/appflume:testing
sudo docker rmi -f moonnoon/hadoop:testing
sudo docker rmi -f moonnoon/elasticsearch:testing
sudo docker rmi -f moonnoon/storm:testing
