#!/bin/bash
#example of mailing from a script

USER="steven.marcus@noaa.gov"
FTYPE="onestop-api.war"
CRIT='Nov 21'


if ls -l /var/lib/tomcat/webapps/ -lh | grep $FTYPE | grep -v "${CRIT}" ; then
#echo -e "\nhas changed"
ls -l /var/lib/tomcat/webassps -lh | grep $FTYPE > /home/steven.marcus/onestop_updated.txt
mail -s "Onestop WAR file updated" $USER < /home/steven.marcus/onestop_updated.txt 
#else
#echo -e "\n is the same"
fi

