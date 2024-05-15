#!/bin/bash
TEST="9"
USER="steven.marcus@noaa.gov"

for j in test prod
do
  for i in 1 2 3
  do
    if host os-es5-${j}0${i}.ncei.noaa.gov | grep "1${TEST}\d" > /tmp/output
    then
        #echo ${TEST} is there
        mail -s "DNS is fixed now" ${USER} < /tmp/output
        exit
    fi
  done
done
