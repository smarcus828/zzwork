#!/bin/bash
## working with GETOPTS 
# set -x

tester=true
VERBOSE=false
DEBUG=false

show_msg()
{
	echo "This is the usage message
	-m  takes an argument
	-vV verbose
	-d  debug
	-?  this message
	-f  Fleebnar
	"
}

echo "Begin"
while getopts ":vVdm:" OPTION
do
	case "${OPTION}" in
		'm') MSG="${OPTARG}";;
		'v') VERBOSE=true;;
		'V') VERBOSE=true;;
		'd') DEBUG=true;;
		'?') show_msg && exit 1 ;;
		'#') echo "default" && show_msg && exit 1;;
	esac
done

shift $(( ${OPTIND} -1 ))  # necessary to access arguments without flags

(${VERBOSE}) && echo "This is VERBOSE"
(${VERBOSE}) && set -x

(${DEBUG}) && echo "MSG: ${MSG}  and #MSG: ${#MSG}"
(${DEBUG}) && (( ${#MSG} < 5 )) && echo "shorter than 5"
(${DEBUG}) && echo "Debug flag is true"
(${DEBUG}) && echo "Number of arguments: $#"



# echo "Tester true/false"
# ( $tester ) || echo "OR tester is true"
# ( ! $tester ) || echo "OR tester is false"
# ( $tester ) && echo "AND tester is true"
# ( ! $tester ) && echo "AND tester is false"
# ( $tester ) && echo "3 true" || echo "3 false"

(${DEBUG}) && echo "first untagged argument is: ${1}"
