#!/bin/bash


FILE="/home/smarcus/zzwork/service_agreements.txt"
OUT_FILE="/tmp/service_tmp.txt"
NOWDATE=$(date '+%s')
MAIL_TO="admin@cicsnc.org"
LEAD=40

#echo "" > ${OUT_FILE}
rm -f ${OUT_FILE} &>/dev/null
touch ${OUT_FILE} &>/dev/null

while read -r line
do
    #echo ${line}
    date_tmp=$(echo ${line} | awk '{print $1}')
    localdate=$(date -d ${date_tmp} +%s )
    data=$(echo ${line} | awk '{$1 = ""; print $0;}')
    
    diff="$((${localdate}-${NOWDATE}))"
        days_left="$((${diff}/86400))"

    #echo "check ${data} is for ${date_tmp} and localdate is ${localdate} and diff is ${days_left}"

    # if [ ${days_left} -le 0 ]
    #         then echo "## --> ${data} exipred ${days_left} days ago <-- ####"
    #     elif [ ${days_left} -le 90 ]
    #         then echo "!! --> ${data} only has ${days_left} days left  <-- !!!!"
        
    #     else
    #         echo "${data} ----> ${days_left} days remaining."
    # fi


    if [ ${days_left} -le 0 ]
            then echo "## --> ${data} exipred ${days_left} days ago on ${date_tmp} <-- ####" >> ${OUT_FILE}
        elif [ ${days_left} -le ${LEAD} ]
            then echo "!! --> ${data} only has ${days_left} days left and EXPIRES on ${date_tmp}<-- !!!!" >> ${OUT_FILE}
    fi

done < ${FILE}

# echo -e "\n\ndisplaying output file"
cat ${OUT_FILE}

#if [ -s ${OUT_FILE} ]; then
    #echo "mail stuff"
#    mail -s "Service Agreements Expiring" ${MAIL_TO} < ${OUT_FILE}
#else
    #echo "mail nothing"
#fi
