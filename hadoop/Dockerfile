#Hadoop
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

#ssh
#RUN apt-get install -qqy ssh rsync
#

RUN mkdir -p /opt/hadoop
RUN wget -q -O - http://archive.apache.org/dist/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz | \
tar -zxf - -C /opt/hadoop --strip-components=1
ENV HADOOP_PREFIX /opt/hadoop
WORKDIR /opt/hadoop
