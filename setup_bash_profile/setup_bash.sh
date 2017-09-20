#!/bin/bash

LHOMEDIR="/home/steven.marcus/zzwork/setup_bash_profile/"
RHOMEDIR="/home/steven.marcus/"
FILE=".bash_profile"
SCRIPT="change_my_environment.sh"

if [[ $# -eq 0 ]]; then
  echo "Yeah - this script needs an argument.  A hostname or IP or something."
  sleep 3
  echo "dumbass"
  exit 0 
fi

scp ${LHOMEDIR}${SCRIPT} ${1}: &>/dev/null
ssh ${1} ${RHOMEDIR}${SCRIPT} &>/dev/null

#create a function at the command line - because an alias wont take an argument
#sshh() {
#> cd /home/steven.marcus/zzwork/setup_bash_profile/
#> ./setup_bash.sh $1
#> }
#
