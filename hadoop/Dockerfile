#Hadoop
#
#VERSION 0.0.1

FROM moonnoon/base:testing
MAINTAINER Fei Lee <lee.lfff@gmail.com>

#ssh
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy ssh rsync supervisor
#need set /etc/ssh/ssh_config StrictHostKeyChecking no
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN ssh-keygen -t dsa -P '' -f /root/.ssh/id_dsa
RUN cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys

RUN mkdir -p /var/run/sshd
RUN echo 'root:test' |chpasswd
ADD ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


RUN mkdir -p /opt/hadoop
#Todo
#This is 32bit, need to compile in the future
#$HADOOP_HOME/lib/native/libhadoop.so.1.0.0 	32bit
RUN wget -q -O - http://archive.apache.org/dist/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz | \
tar -zxf - -C /opt/hadoop --strip-components=1
WORKDIR /opt/hadoop

#set hadoop
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_COMMON_LIB_NATIVE_DIR /opt/hadoop/lib/native
#set JAVA_HOME at hadoop/hadoop-env.sh
RUN sed -i "/^export JAVA_HOME/ s:.*:export JAVA_HOME=$JAVA_HOME:" /opt/hadoop/etc/hadoop/hadoop-env.sh

ADD ./conf/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
ADD ./conf/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml

EXPOSE 22

#start ssh dfs
ADD ./startup.sh /opt/hadoop/startup.sh
CMD ["/opt/hadoop/startup.sh"]
