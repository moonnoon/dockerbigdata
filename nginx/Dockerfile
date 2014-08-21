#nginx
#
#VERSION 0.0.1

FROM debian:wheezy
MAINTAINER Fei Lee <lee.lfff@gmail.com>

ADD http://nginx.org/keys/nginx_signing.key /tmp/nginx_signing.key
RUN apt-key add /tmp/nginx_signing.key
RUN echo "deb http://nginx.org/packages/mainline/debian/ wheezy nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/mainline/debian/ wheezy nginx" >> /etc/apt/sources.list

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy nginx

ADD ./conf/nginx.conf /etc/nginx/nginx.conf
ADD ./startup.sh /opt/startup.sh

expose 80 443

cmd ["/opt/startup.sh"]
