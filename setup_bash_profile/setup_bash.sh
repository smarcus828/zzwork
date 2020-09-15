#!/bin/bash

LHOMEDIR="/home/smarcus/zzwork/setup_bash_profile/"
RHOMEDIR="/home/smarcus/"
SCRIPT1="change_my_environment.sh"
SCRIPT2=".bash_profile"

if [[ $# -eq 0 ]]; then
  echo "Yeah - this script needs an argument.  A hostname or IP or something."
  sleep 3
  echo "dumbass"
  exit 0 
fi

scp ${LHOMEDIR}${SCRIPT1} ${LHOMEDIR}${SCRIPT2} ${1}: &>/dev/null
ssh ${1} ${RHOMEDIR}${SCRIPT} &>/dev/null

#create a function at the command line - because an alias wont take an argument
#sshh() {
#> cd /home/steven.marcus/zzwork/setup_bash_profile/
#> ./setup_bash.sh $1
#> ssh $1
#> }
#
