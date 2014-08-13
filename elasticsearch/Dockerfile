#elasticsearch
#
#VERSION 0.0.1

FROM moonnoon/base:testing
MAINTAINER Fei Lee <lee.lfff@gmail.com>

RUN mkdir -p /opt/elasticsearch
RUN wget -q -O - https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz | \
tar -zxf - -C /opt/elasticsearch --strip-components=1

EXPOSE 9300

CMD ["/opt/elasticsearch/bin/elasticsearch"]
