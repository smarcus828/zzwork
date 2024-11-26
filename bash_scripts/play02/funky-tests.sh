#!/bin/bash
fleebnar="fleebnar"

# echo "script_type: $script_type"
# echo "dev: $dev"
echo "LANG:  $LANG"

[ $fleebnar ] && echo "yes fleebnar" || echo "no fleebnar"
[ ! "$fleebnar" ] || echo "yes fleebnar"

# [ "$script_type" ] || exit 0
# [ "$dev" ] || exit 0