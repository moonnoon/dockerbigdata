#base OS
#
#VERSION 0.0.1

FROM debian:wheezy
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy git wget vim ca-certificates

#install java
RUN \
	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list && \
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
	apt-get update

RUN DEBIAN_FRONTEND=noninteractive \
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	apt-get install -y oracle-java7-installer && \ 
	apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
