#zookeeper
#
#VERSION 0.0.1

FROM moonnoon/base:testing
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN mkdir -p /opt/zookeeper
RUN wget -q -O - http://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | \
tar -zxf - -C /opt/zookeeper --strip-components=1

WORKDIR /opt/zookeeper
ADD ./conf/zoo.cfg /opt/zookeeper/conf/zoo.cfg

EXPOSE 2181

CMD ["bin/zkServer.sh", "start"]
