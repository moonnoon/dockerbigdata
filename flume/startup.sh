#!/bin/bash
#
#startup.sh

#run
bin/flume-ng agent --conf conf --conf-file conf/flume-conf.properties --name consumer -Dflume.root.logger=INFO,console
