#Storm
#
#VERSION 0.0.1

FROM moonnoon/base:testing
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN apt-get install -qqy maven

RUN mkdir -p /opt/storm
RUN wget -q -O - http://archive.apache.org/dist/incubator/storm/apache-storm-0.9.2-incubating/apache-storm-0.9.2-incubating.tar.gz | \
tar -zxf - -C /opt/storm --strip-components=1

#require kafka_2.10-0.8.1.1.jar
RUN mkdir -p /opt/kafka/
RUN wget -q -O - https://archive.apache.org/dist/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz | \
tar -zxf - -C /opt/kafka/ --strip-components=1
RUN cp /opt/kafka/libs/kafka_2.10-0.8.1.1.jar /opt/storm/lib/
RUN cp /opt/kafka/libs/scala-library-2.10.1.jar /opt/storm/lib/
RUN cp /opt/kafka/libs/metrics-core-2.2.0.jar /opt/storm/lib/

RUN git clone https://github.com/apache/incubator-storm.git /opt/incubator-storm/

WORKDIR /opt/incubator-storm/external/storm-kafka/
RUN sed -i "s/0.9.3-incubating-SNAPSHOT/0.9.2-incubating/" pom.xml
RUN mvn install -Dmaven.test.skip=true

ADD src/Test.java /opt/storm/examples/storm-starter/src/jvm/storm/starter/Test.java
ADD ./pom.xml /opt/storm/examples/storm-starter/pom.xml
WORKDIR /opt/storm/examples/storm-starter

RUN mvn package

ADD ./startup.sh /opt/storm/examples/storm-starter/startup.sh

CMD ["/opt/storm/examples/storm-starter/startup.sh"]
