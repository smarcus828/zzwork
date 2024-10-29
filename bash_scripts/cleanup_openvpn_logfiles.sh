## cleans up old openvpn logfiles - smarcus
#!/bin/bash
DAYS=29
DIR="/var/log/"

echo -n "ENTER number of days: "
read DAYS
if [[ ! ${DAYS} =~ ^[0-9]+$ ]] ; then
    echo "No good"
    exit
fi

BEGIN=$(find . ${DIR} -iname "openvpnas.log*" | wc -l)
AFTER=$(find . ${DIR} -iname "openvpnas.log*" -mtime +${DAYS} | wc -l)
#DIFF=$((BEGIN-(BEGIN-AFTER)))

if [[ ${AFTER} -eq 0 ]]; then
	echo -e  "\nExiting - no files older than ${DAYS} days found\n"
	exit
fi


#find . -iname "openvpnas.log*" -mtime +30 -exec rm {} \;
echo "Deleting openvpn log files from ${DIR} older than ${DAYS} days"
echo "TOTAL files: ${BEGIN}"
echo "Files older than ${DAYS} days: ${AFTER}"
#echo "Difference: ${DIFF}"

## DEFAULT VARIABLE REPLY - cool
read -p "Delete ${AFTER} old files? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    find ${DIR} -iname "openvpnas.log*" -mtime +${DAYS} -exec rm {} \;
    echo -e "\n${AFTER} Files deleted"
else
    echo -e "\nAborted.\n"
fi

