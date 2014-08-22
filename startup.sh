#!/bin/bash
#
#sudo ./startup.sh

WAITING_TIME=64
waitfunc()
{
	CURRENT=0
	while [ $CURRENT -le $WAITING_TIME ]; do
		CURRENT=$(($CURRENT + 1))
		RESULT=$(sudo docker logs $1 2>&1)
		if grep -q "$2" <<< $RESULT ; then
			break
		fi
		sleep 1
	done
}

echo -e "Starting...\nIt will take some time.\n"

#remove before container
sudo docker rm -f data 1>&- 2>&-
sudo docker rm -f nginx 1>&- 2>&-
sudo docker rm -f zookeeper 1>&- 2>&-
sudo docker rm -f kafka 1>&- 2>&-
sudo docker rm -f appflume 1>&- 2>&-
sudo docker rm -f hadoop 1>&- 2>&-
sudo docker rm -f elasticsearch 1>&- 2>&-
sudo docker rm -f flume 1>&- 2>&-
sudo docker rm -f storm 1>&- 2>&-

#
#run
#
#data
sudo docker run -d -P --name data moonnoon/data:testing
#zookeeper
sudo docker run -d -P --volumes-from data --name zookeeper moonnoon/zookeeper:testing
#hadoop
sudo docker run -d -P --volumes-from data --name hadoop --link zookeeper:zookeeper  moonnoon/hadoop:testing
#elasticsearch
sudo docker run -d -P --volumes-from data --name elasticsearch --link zookeeper:zookeeper moonnoon/elasticsearch:testing
#nginx
sudo docker run -d -p 80:80 -p 443:443 --volumes-from data --name nginx moonnoon/nginx:testing

#waiting for zookeeper finish start
waitfunc zookeeper 'binding to port 0.0.0.0/0.0.0.0:2181'

#kafka
sudo docker run -d -P --volumes-from data --name kafka --link zookeeper:zookeeper moonnoon/kafka:testing

#waiting for zookeeper finish start
waitfunc kafka 'INFO success: kafka entered RUNNING state'

#storm
sudo docker run -d -P --volumes-from data --name storm --link zookeeper:zookeeper moonnoon/storm:testing

#appflume
ID=$(sudo docker run -d -P --volumes-from data --name appflume --link zookeeper:zookeeper --link kafka:kafka moonnoon/appflume:testing)

#waiting for hadoop finish start
waitfunc hadoop 'INFO exited: dfs (exit status 0; expected)'

#flume
sudo docker run -d -P --volumes-from data --name flume --link zookeeper:zookeeper --link hadoop:hadoop --link elasticsearch:elasticsearch moonnoon/flume:testing

#
#IP=$(sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $ID)
#echo -e "\nplease connect $IP:44444 or localhost:$(sudo docker port appflume 44444 | cut -d":" -f2)"

echo -e "\nCongratulations!!!\nFinished"
