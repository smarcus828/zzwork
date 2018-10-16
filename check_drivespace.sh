#!/bin/bash
# Yes I know that this is stupid but icinga isn't working right now
LEVEL=9
FILE="/tmp/file"
USER="steven.marcus@noaa.gov"

if df --output=pcent -h | grep ${LEVEL}[0-9]% &>/dev/null;
then
  hostname > ${FILE}
  df --output=pcent,source -h | grep ${LEVEL}[0-9]% >> ${FILE}
  mail -s "Drive space full on $(hostname)" ${USER} < ${FILE}
  #cat ${FILE}
fi
