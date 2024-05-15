#!/bin/bash

# ssh-keygen -R ${1}
TIMES=$(grep -c ${1} ~/.ssh/known_hosts ) &>/dev/null
echo "${1} found ${TIMES} times in known_hosts" 

if [[ ${1} =~ ^[0-9] ]]; then
# Its an IP
    # echo "first char is number"
    ssh-keygen -R ${1}
else
# Its a name
    echo "first char is letter"
    if grep -i "cics" <<< ${1} &>/dev/null ; then
        # echo "Its a FQDN"
        HOST="${1%%.*}"
        # echo "Just the hostname: ${HOST}"
        ssh-keygen -R ${HOST}
        ssh-keygen -R ${HOST}.cicsnc.org
        ssh-keygen -R ${HOST}.ncics.org
    else
        ssh-keygen -R ${1}
        ssh-keygen -R ${1}.cicsnc.org
        ssh-keygen -R ${1}.ncics.org
    fi
fi
ssh ${1}

# ssh -oStrictHostKeyChecking=accept-new ${1}



