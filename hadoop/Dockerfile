#Hadoop
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

#ssh
#RUN apt-get install -qqy ssh rsync
#
#need set /etc/ssh/ssh_config BatchMode no
#

RUN mkdir -p /opt/hadoop
#Todo
#This is 32bit, need to compile in the future
#$HADOOP_HOME/lib/native/libhadoop.so.1.0.0 	32bit
RUN wget -q -O - http://archive.apache.org/dist/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz | \
tar -zxf - -C /opt/hadoop --strip-components=1
WORKDIR /opt/hadoop

#set hadoop
ENV HADOOP_PREFIX /opt/hadoop
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_PREFIX/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_PREFIX/lib"
#

RUN bin/hdfs namenode -format

#start dfs
CMD ["sbin/start-dfs.sh"]
