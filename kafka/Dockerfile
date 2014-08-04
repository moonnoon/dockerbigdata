#kafaka
#
#VERSION 0.0.1

FROM debian:wheezy
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN mkdir -p /opt/kafka/
RUN wget -q -O - https://archive.apache.org/dist/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz | \
tar -zxf - -C /opt/kafka/ --strip-components=1

WORKDIR /opt/kafaka/
