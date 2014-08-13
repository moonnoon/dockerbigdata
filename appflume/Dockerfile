#appflume
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

#download flume
RUN mkdir -p /opt/flume
RUN wget -q -O - https://archive.apache.org/dist/flume/1.5.0/apache-flume-1.5.0-bin.tar.gz | \
tar -zxf - -C /opt/flume --strip-components=1

WORKDIR /opt
#flume-kafka
RUN git clone https://github.com/beyondj2ee/flumeng-kafka-plugin.git

#
RUN cp flumeng-kafka-plugin/flumeng-kafka-plugin/conf/flume-conf.properties flume/conf/
RUN cp flumeng-kafka-plugin/flumeng-kafka-plugin/package/flumeng-kafka-plugin.jar flume/lib/
RUN cp flumeng-kafka-plugin/flumeng-kafka-plugin/libs/*.jar flume/lib/

ADD ./conf/flume-conf.properties /opt/flume/conf/flume-conf.properties
ADD ./startup.sh /opt/flume/startup.sh

CMD ["/opt/flume/startup.sh"]
