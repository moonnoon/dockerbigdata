#!/bin/bash
#
#startup.sh

export TOPIC=test

#configure
sed -i "s/^#advertised.host.name=<hostname routable by clients>/advertised.host.name=$(hostname -i)/" /opt/kafka/config/server.properties
cp /opt/kafka/config/server.properties /opt/kafka/config/server-1.properties 
cp /opt/kafka/config/server.properties /opt/kafka/config/server-2.properties 
sed -i "s/^broker.id=0/broker.id=1/" /opt/kafka/config/server-1.properties
sed -i "s/^port=9092/port=9093/" /opt/kafka/config/server-1.properties
sed -i "s/^log.dirs=\/tmp\/kafka-logs/log.dirs=\/tmp\/kafka-logs-1/" /opt/kafka/config/server-1.properties
sed -i "s/^broker.id=0/broker.id=2/" /opt/kafka/config/server-2.properties
sed -i "s/^port=9092/port=9094/" /opt/kafka/config/server-2.properties
sed -i "s/^log.dirs=\/tmp\/kafka-logs/log.dirs=\/tmp\/kafka-logs-2/" /opt/kafka/config/server-2.properties

#start kafka server
service supervisor start
sleep 5s

#create a topic "test" with single partion and only one replica
bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 2 --partitions 20 --topic $TOPIC

#change to foreground
#service supervisor stop
supervisorctl stop all
supervisorctl shutdown
sed -i "s/nodaemon=false/nodaemon=true/" /etc/supervisor/conf.d/supervisord.conf
service supervisor start
