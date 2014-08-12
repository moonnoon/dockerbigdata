#zookeeper
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN mkdir -p /opt/zookeeper
RUN wget -q -O - http://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | \
tar -zxf - -C /opt/zookeeper --strip-components=1

WORKDIR /opt/zookeeper
ADD ./zoo.cfg conf/zoo.cfg

EXPOSE 2181

CMD ["bin/zkServer.sh", "start"]
