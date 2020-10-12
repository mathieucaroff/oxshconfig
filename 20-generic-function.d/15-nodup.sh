#!/bin/dash

nodup() {
    if [ $# -lt 1 ]
    then set '
'
    fi
    /usr/bin/awk -v RS="$1" -v ORS="$1" '!a[$1]++' | head -c-1
}