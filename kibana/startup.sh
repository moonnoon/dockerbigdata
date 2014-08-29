#!/bin/bash
#
#startup.sh

echo "ServerName $(cat /etc/hosts | head -n1 | cut -f1)" >> /etc/apache2/apache2.conf

apache2ctl -DFOREGROUND -kstart
