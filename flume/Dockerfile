#flume
#
#VERSION 0.0.1

FROM moonnoon/base:testing
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


#74
#download hadoop, to get libhadoop.so.1.0.0, commons-configuration-1.6.jar, etc
RUN mkdir -p /opt/hadoop
RUN wget -q -O - http://archive.apache.org/dist/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz | \
tar -zxf - -C /opt/hadoop --strip-components=1
RUN cp /opt/hadoop/share/hadoop/tools/lib/commons-configuration-1.6.jar /opt/flume/lib/
RUN cp /opt/hadoop/share/hadoop/tools/lib/hadoop-auth-2.4.1.jar /opt/flume/lib/
RUN cp /opt/hadoop/share/hadoop/common/hadoop-common-2.4.1.jar /opt/flume/lib/
RUN cp /opt/hadoop/share/hadoop/hdfs/hadoop-hdfs-2.4.1.jar /opt/flume/lib/
ENV HADOOP_COMMON_LIB_NATIVE_DIR /opt/hadoop/lib/native

#download elasticsearch
RUN mkdir -p /opt/elasticsearch
RUN wget -q -O - https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz | \
tar -zxf - -C /opt/elasticsearch --strip-components=1
RUN cp /opt/elasticsearch/lib/elasticsearch-1.3.1.jar /opt/flume/lib/
RUN cp /opt/elasticsearch/lib/lucene-core-4.9.0.jar /opt/flume/lib/


ADD ./startup.sh /opt/flume/startup.sh
ADD ./conf/flume-conf.properties /opt/flume/conf/flume-conf.properties
ADD ./conf/flume-env.sh /opt/flume/conf/flume-env.sh

WORKDIR /opt/flume
CMD ["./startup.sh"]
