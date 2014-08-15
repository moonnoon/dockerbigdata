#data
#
#VERSION 0.0.1

FROM debian:wheezy
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy supervisor openssh-server

RUN echo 'root:test' |chpasswd

ADD ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/data"]

EXPOSE 22

CMD ["/usr/bin/supervisord"]
