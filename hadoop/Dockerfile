#Hadoop
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

#ssh
RUN apt-get install -qqy ssh rsync
#need set /etc/ssh/ssh_config StrictHostKeyChecking no
RUN echo StrictHostKeyChecking no >> /etc/ssh/ssh_config


RUN mkdir -p /opt/hadoop
#Todo
#This is 32bit, need to compile in the future
#$HADOOP_HOME/lib/native/libhadoop.so.1.0.0 	32bit
RUN wget -q -O - http://archive.apache.org/dist/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz | \
tar -zxf - -C /opt/hadoop --strip-components=1
WORKDIR /opt/hadoop

#set hadoop
RUN export HADOOP_PREFIX=/opt/hadoop
RUN export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_PREFIX/lib/native
RUN export HADOOP_OPTS="-Djava.library.path=$HADOOP_PREFIX/lib"
#set JAVA_HOME at hadoop/hadoop-env.sh
RUN sed -i "/^export JAVA_HOME/ s:.*:export JAVA_HOME=$JAVA_HOME:" $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

ADD ./conf/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
ADD ./conf/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

#start dfs ssh
ADD ./startup.sh /opt/hadoop/startup.sh
CMD ["/opt/hadoop/startup.sh"]
