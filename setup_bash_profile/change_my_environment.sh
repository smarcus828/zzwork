#!/bin/bash
HOMEDIR="/home/steven.marcus/"
FILE=".bash_profile"

if grep "smarcus additions" ${HOMESIR}${FILE};
then
  echo "Already there"
else
  echo "### smarcus additions ###" >> ${HOMEDIR}${FILE}
  echo "cat /etc/redhat-release" >> ${HOMEDIR}${FILE}
  echo "date" >> ${HOMEDIR}${FILE}
fi

rm -f $0
