#kibana
#
#VERSION 0.0.1

FROM moonnoon/base:testing
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy apache2

RUN mkdir -p /var/www/kibana
RUN wget -q -O - https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz | \
tar -zxf - -C /var/www/kibana --strip-components=1

EXPOSE 80
ADD ./startup.sh /opt/startup.sh
CMD ["/opt/startup.sh"]
