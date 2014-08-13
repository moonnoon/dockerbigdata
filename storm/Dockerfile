#Storm
#
#VERSION 0.0.1

FROM moonnoon/base:testing
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN apt-get install -qqy maven

RUN mkdir -p /opt/storm
RUN wget -q -O - http://archive.apache.org/dist/incubator/storm/apache-storm-0.9.2-incubating/apache-storm-0.9.2-incubating.tar.gz | \
tar -zxf - -C /opt/storm --strip-components=1

RUN git clone https://github.com/apache/incubator-storm.git /opt/incubator-storm/

WORKDIR /opt/incubator-storm/external/storm-kafka/
RUN sed -i "s/0.9.3-incubating-SNAPSHOT/0.9.2-incubating/" pom.xml
RUN mvn install

ADD src/Test.java /opt/storm/examples/storm-starter/src/jvm/storm/starter/Test.java
ADD ./pom.xml /opt/storm/examples/storm-starter/pom.xml
WORKDIR /opt/storm/examples/storm-starter
RUN mvn package
