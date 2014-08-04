#flume
#
#VERSION 0.0.1

FROM debian:wheezy
MAINTAINER Fei Lee <lee.lfff@gmail.com>

#download
RUN mkdir flume
RUN wget -q -O - https://archive.apache.org/dist/flume/1.5.0/apache-flume-1.5.0-bin.tar.gz | \
tar -zxf - -C /opt/flume --strip-components=1

#flume-kafka
RUN git clone https://github.com/beyondj2ee/flumeng-kafka-plugin.git
RUN sed -i -e"s/^producer.sources.s.type\s*=\s*seq/producer.sources.s.type = netcat/" flumeng-kafka-plugin/conf/flume-conf.properties
# producer.sources.s.command = tail -f -n+1 /mnt/hgfs/vmshare/test.log
# producer.sources.s.channels = c
#
RUN cp flumeng-kafka-plugin/flumeng-kafka-plugin/conf/flume-conf.properties apache-flume-1.5.0-bin/conf/
RUN cp flumeng-kafka-plugin/flumeng-kafka-plugin/package/flumeng-kafka-plugin.jar apache-flume-1.5.0-bin/lib/
RUN cp flumeng-kafka-plugin/flumeng-kafka-plugin/libs/*.jar apache-flume-1.5.0-bin/lib/

