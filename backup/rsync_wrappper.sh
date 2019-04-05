#!/bin/bash
progName=`basename $0`

if [ -n "${DEBUG}" ] && [ "${DEBUG}" == "1" ]; then
    for i in "$@"; do
        echo "ARG: $i"
    done
fi

function usage {
    echo "usage: $progName [SOURCE] [DESTINATION]"
    exit 1
}

if [ $# -lt 2 ]; then
	usage
fi
SRC="$1"
DST="$2"

echo "CALLING: rsync \"${SRC}\" \"${DST}\""
rsync -avh --progress --stats "${SRC}" "${DST}"
rc=$?
echo "FINISHED with status $rc"

exit $rc
