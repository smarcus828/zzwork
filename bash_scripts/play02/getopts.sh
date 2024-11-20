#!/bin/bash
echo "Begin"
while getopts ":vVm:" OPTION
do
	case "${OPTION}" in
		'm') MSG="${OPTARG}";;
		'v') VERBOSE=1;;
		'V') VERBOSE=1;;
		'?') show_msg && return 1 ;;
		'#') echo "default" && show_msg && return 1;;
	esac
done

shift $(( ${OPTIND} -1 ))

echo "MSG: ${MSG}  and #MSG: ${#MSG}"

(( ${#MSG} < 3 )) && echo "shorter than 3"
