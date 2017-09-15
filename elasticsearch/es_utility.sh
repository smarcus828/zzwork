#!/bin/bash

PWFILE="/home/steven.marcus/privileged/espass.txt"
USER="dap-manager"
PASS=$(egrep ${USER} ${PWFILE} | awk '{print $2}')
#echo -e "User is ${USER} Password is ${PASS}"

AUSER="admin"
APASS="nothing"
#echo -e "User is ${AUSER} Password is ${APASS} File is ${PWFILE}"
APASS=$(egrep ${AUSER} ${PWFILE} | awk '{print $2}')
#echo -e "User is ${AUSER} Password is ${APASS}"
AFTER=""
OPERATOR="XGET"



while read line
do

if  echo $line | grep -v "^#" &>/dev/null
then
  #echo $line

  HOST=$(echo $line | awk '{print $1}')
  PORT=$(echo $line | awk '{print $2}')
  LOGIN=$(echo $line | awk '{print $3}')
  DESCRIP=$(echo $line | awk '{print $4 " " $5 " " $6}')  # Was this here for Vagrant??
  DESCRIP=$(echo $line | awk '{print $4}')
  CURL=true



######  Add login information if needed ######
  if  [ $LOGIN == "login" ]; then
    #echo "Login Required"
    ARGS=" -u ${USER}:${PASS}"
  else
    ARGS=''
  fi
###############################################


#######  Switch for command line argument ######
case "$1" in

stats)
  CMD="_cluster/stats?pretty=true"
;;

alloc)
  CMD="_cat/allocation?v"
;;

state)
  CMD="_cluster/state?pretty=true"
;;

health)
  CMD="_cluster/health?pretty=true"
;;

cathealth)
  CMD="_cat/health?pretty=true"
;;

count)
  CMD="_count?pretty=true"
;;

ihealth)
  CMD="_cluster/health?level=indices&pretty=true"
;;

master)
  CMD="_cat/master"
;;

settings)
  CMD="_settings?pretty=true"
;;

csettings)
  CMD="_cluster/settings?pretty=true"
;;

shards)
  CMD="_cluster/health?level=shards&pretty=true"
;;

plugins)
  #CMD="_cat/plugins?v&pretty=true"
  CMD="_cat/plugins?v"
;;

get_trans)
  CMD="_cluster/settings?pretty"
;;

set_debug)
  CMD="_cluster/settings -d '{\"transient\":{\"logger._root\":\"DEBUG\"}}'"
  ARGS=" -u ${AUSER}:${APASS}"
  OPERATOR="XPUT"
;;

clear_debug)
  CMD="_cluster/settings -d '{\"transient\":{\"logger._root\":\"WARN\"}}'"
  ARGS=" -u ${AUSER}:${APASS}"
  OPERATOR="XPUT"
;;

indices)
  CMD='_cat/indices/?v '
  if  [ $LOGIN == "login" ]; then
    ARGS=" -u ${AUSER}:${APASS}"
  fi
;;

nodes_stats)
  CMD="_nodes/stats?pretty=true"
;;

steven_check)
  COLOR="\e[1;49;91m"
  echo -e "Heap percent used should be less than ${COLOR}85%"
  CMD="_nodes/stats?pretty=true"
  AFTER=" | grep heap_used_percent"

;;

license)  ## requires admin rights if license is expired #####
  CMD="_license"
  if  [ $LOGIN == "login" ]; then
    ARGS=" -u ${AUSER}:${APASS}"
  fi
;;

s)
  CMD=''
;;

tunnel)
echo -e "\e[0;49;36m * * * Setting up \e[1;49;36m${DESCRIP}:${PORT} \e[0;49;36mtunnel * * *\e[0m"
 ssh -f steven.marcus@${DESCRIP} -L ${PORT}:${DESCRIP}:9200 -N &>/dev/null
 ssh -f steven.marcus@${DESCRIP} -L ${PORT}:${DESCRIP}:9200 -N
 echo "localhost:${PORT} -> ${DESCRIP}:9200"
 CURL=false
;;

killtunnels)
echo -e "\e[0;49;36m * * * KILLing \e[1;49;36m${DESCRIP}:${PORT} \e[0;49;36mtunnel * * *\e[0m"
PID=$(ps aux | grep ${DESCRIP} | grep -v grep | awk '{print $2}')
echo -e "\nThe PID for ${DESCRIP} is ${PID}"
kill -9 ${PID}
CURL=false
;;


check)
echo -e "\e[0;49;36m* * * Connection to  \e[1;49;36m${DESCRIP}:9200 at localhost:${PORT} \e[0;49;36m* * *\e[0m"
if curl localhost:${PORT} &>/dev/null; then
  COLOR="\e[1;49;92m"
  echo -e "${DESCRIP} ${COLOR}good\e[0m"
else
  COLOR="\e[1;49;91m"
  echo -e "${DESCRIP} ${COLOR}bad\e[0m"
fi
CURL=false
;;

*)
  echo -e "\n\nQueries servers listed in es_hosts.conf"
  echo -e "\nUse: $0 [something]"
  echo -e "\nsomething:"

  echo -e "\nTunnel Stuff"
  echo -e "\tcheck = check localhost tunnel status"
  echo -e "\ttunnel = create tunnels from localhost"
  echo -e "\tkilltunnels = kill tunnels from localhost"

  echo -e "\nCluster Stuff"
  echo -e "\tcsettings = cluster settings"
  echo -e "\thealth = cluster health"
  echo -e "\tihealth = cluster health level=indices"
  echo -e "\tshards = cluster health level=shards"
  echo -e "\tstate = cluster state *long* "
  echo -e "\tstats = cluster information *long* "

  echo -e "\nNode Stuff"
  echo -e "\talloc = shards allocated to each node"
  echo -e "\tcathealth = node health"
  echo -e "\tcount = documents on each node"
  echo -e "\tnodes_stats = way too much info about nodes"

  echo -e "\nIndex Stuff"
  echo -e "\tsettings = index settings"
  echo -e "\tindices = shows indices"

  echo -e "\nOther Stuff"
  echo -e "\tplugins = list plugins on all nodes"
  echo -e "\tlicense = license"
  echo -e "\ts = empty query - returns basic info"
  echo -e "\tget_trans = get transient settings"
  echo -e "\tset_debug = set logging to DEBUG"
  echo -e "\tclear_debug = set logging to WARN"
  echo -e "\n\n\n"
  exit
;;

esac



##########  The Actual Command ####################
if ${CURL}
then
  echo -e "\e[0;49;36m * * * Querying \e[1;49;36m${HOST}:${PORT} ${DESCRIP} \e[0;49;36m* * *\e[0m"

#  echo -e "curl -k -s ${OPERATOR} ${ARGS} https://${HOST}:${PORT}/${CMD}${AFTER}"
  eval curl -k -s ${OPERATOR} ${ARGS} https://${HOST}:${PORT}/${CMD}${AFTER}
  echo -e "\n\n"
fi
fi

done < es_hosts.conf
