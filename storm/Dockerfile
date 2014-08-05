#Storm
#
#VERSION 0.0.1

FROM moonnoon/base:latest
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN mkdir -p /opt/storm
RUN wget -q -O - http://archive.apache.org/dist/incubator/storm/apache-storm-0.9.2-incubating/apache-storm-0.9.2-incubating.tar.gz | \
tar -zxf - -C /opt/storm --strip-components=1
WORKDIR /opt/storm
