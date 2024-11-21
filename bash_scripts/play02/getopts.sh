#!/bin/bash
## working with GETOPTS 

tester=true
VERBOSE=false
DEBUG=false

show_msg()
{
	echo "This is the usage message"
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

echo "MSG: ${MSG}  and #MSG: ${#MSG}"

(( ${#MSG} < 3 )) && echo "shorter than 3"

(${VERBOSE}) && echo "This is VERBOSE"
(${DEBUG}) && echo "Debug flag is true"
echo "Number of arguments: $#"



# echo "Tester true/false"
# ( $tester ) || echo "OR tester is true"
# ( ! $tester ) || echo "OR tester is false"
# ( $tester ) && echo "AND tester is true"
# ( ! $tester ) && echo "AND tester is false"
# ( $tester ) && echo "3 true" || echo "3 false"

echo "first untagged argument is: ${1}"
