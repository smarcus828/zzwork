#!/bin/bash

VERSION=$(facter lsbmajdistrelease)
SERVICES=(
"ntpd"
"besclient"
"cups"
)

#echo Version is ${VERSION}

case ${VERSION} in

6)

for i in ${SERVICES[*]};
do
  if ! service $i status &>/dev/null ;
  then
     service $i restart
  fi
done
;;

7)
for i in ${SERVICES[*]};
do
  if ! systemctl status $i &>/dev/null ;
  then
     systemctl restart  $i
  fi
done
;;

*)
echo "Something went wrong"
;;
esac
