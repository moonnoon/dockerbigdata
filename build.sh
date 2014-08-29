#!/bin/bash
#
#sudo ./build.sh

sudo docker build -t moonnoon/data:testing ./data/
sudo docker build -t moonnoon/nginx:testing ./nginx/
sudo docker build -t moonnoon/base:testing ./base/
sudo docker build -t moonnoon/zookeeper:testing ./zookeeper/
sudo docker build -t moonnoon/kafka:testing ./kafka/
sudo docker build -t moonnoon/flume:testing ./flume/
sudo docker build -t moonnoon/appflume:testing ./appflume/
sudo docker build -t moonnoon/hadoop:testing ./hadoop
sudo docker build -t moonnoon/elasticsearch:testing ./elasticsearch/
sudo docker build -t moonnoon/storm:testing ./storm/
sudo docker build -t moonnoon/kibana:testing ./kibana/
