#!/bin/bash

HOMEDIR="/home/steven.marcus/"
FILE=".bash_profile"
SCRIPT="change_my_environment.sh"

if [[ $# -eq 0 ]]; then
  echo "Yeah - this script needs an argument.  A hostname or IP or something."
  sleep 3
  echo "dumbass"
  exit 0
fi

scp ${SCRIPT} ${1}: &>/dev/null
ssh ${1} ${HOMEDIR}${SCRIPT} &>/dev/null



#echo ${1} 
#if ssh ${1} "cat ${HOMEDIR}${FILE}" | grep "smarcus additions" ; then
#  echo "its already there"
#else
#  ssh ${1} echo -e "\#\#\# smarcus additions \#\#\# >> ${HOMEDIR}${FILE}" &>/dev/null
#  ssh ${1} echo -e "cat /etc/redhat-release >> ${HOMEDIR}${FILE}" &>/dev/null
#fi &>/dev/null
#
