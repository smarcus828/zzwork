#!/bin/bash
keys=$(ssh-keyscan ${1})
echo "Foreign KEYS: ${keys}"

local_keys=$(grep ${1} ~/.ssh/known_hosts)
echo -e "\n\nLocal Keys: ${local_keys}"













# # SSH_OUTPUT=$(ssh $1)
# ssh ${1} > /tmp/test
# SSH_RESULT=$?

# echo "SSH_RESULT: ${SSH_RESULT}"
# # echo "SSH_OUTPUT: ${SSH_OUTPUT}"
# cat /tmp/test

# if [ ${SSH_RESULT} -eq 0 ]; then
#       echo "OK Good"
# else
#   if grep -i Offending <<< "$SSH_OUTPUT" > /dev/null; then
#     echo ssh-keygen -R ${1}
#   else
#     echo "just Broke"
#   fi
# fi