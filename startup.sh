#!/bin/bash
#
#./startup.sh

#remove before container
sudo docker rm -f data 1>&- 2>&-
sudo docker rm -f zookeeper 1>&- 2>&-
sudo docker rm -f kafka 1>&- 2>&-
sudo docker rm -f appflume 1>&- 2>&-
sudo docker rm -f hadoop 1>&- 2>&-
sudo docker rm -f elasticsearch 1>&- 2>&-
sudo docker rm -f flume 1>&- 2>&-
sudo docker rm -f storm 1>&- 2>&-

#run
sudo docker run -d -P --name data moonnoon/base:testing
sudo docker run -d -P --volumes-from data --name zookeeper moonnoon/zookeeper:testing
sudo docker run -d -P --volumes-from data --name kafka --link zookeeper:zookeeper moonnoon/kafka:testing
ID=$(sudo docker run -d -P --volumes-from data --name appflume --link zookeeper:zookeeper --link kafka:kafka moonnoon/appflume:testing)
sudo docker run -d -P --volumes-from data --name hadoop --link zookeeper:zookeeper  moonnoon/hadoop:testing
sudo docker run -d -P --volumes-from data --name elasticsearch --link zookeeper:zookeeper moonnoon/elasticsearch:testing
sudo docker run -d -P --volumes-from data --name flume --link zookeeper:zookeeper --link hadoop:hadoop --link elasticsearch:elasticsearch moonnoon/flume:testing
sudo docker run -d -p --volumes-from data --name storm --link zookeeper:zookeeper moonnoon/storm:testing

#
IP=$(sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $ID)

echo "please connect $IP:44444"
