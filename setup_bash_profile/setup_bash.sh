#!/bin/bash

HOMEDIR="/home/steven.marcus/"
FILE=".bash_profile"


if [[ $# -eq 0 ]]; then
  echo "Yeah - this script needs an argument.  A hostname or IP or something."
  sleep 3
  echo "dumbass"
  exit 0
fi


echo ${1} 
if ssh ${1} "cat ${HOMEDIR}${FILE}" | grep "smarcus additions" ; then
  echo "its already there"
else
  ssh ${1} echo -e "\#\#\# smarcus additions \#\#\# >> ${HOMEDIR}${FILE}" &>/dev/null
  ssh ${1} echo -e "cat /etc/redhat-release >> ${HOMEDIR}${FILE}" &>/dev/null
fi &>/dev/null

#if this gets any longer than two lines, I'll need to copy over a file that changes all that I want and then delete it
