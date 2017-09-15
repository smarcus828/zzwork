#!/bin/bash

PWFILE="/home/steven.marcus/privileged/espass.txt"
AUSER=admin
APASS=$(egrep ${AUSER} ${PWFILE} | awk '{print $2}')
ARGS=" -u ${AUSER}:${APASS}"

HOST=192.168.1.131

curl -XPUT ${ARGS} $HOST:9200/_bulk --data-binary @shakespeare.json
