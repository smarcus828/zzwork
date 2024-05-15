#!/bin/sh

certexpdate=$(/usr/bin/security find-certificate -a -c "name_of_your_cert" -p -Z "/Library/Keychains/System.keychain" | /usr/bin/openssl x509 -noout -enddate| cut -f2 -d=)

dateformat=$(/bin/date -j -f "%b %d %T %Y %Z" "$certexpdate" "+%Y-%m-%d %H:%M:%S")

echo "<result>$dateformat</result>"
