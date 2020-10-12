#!/bin/dash

if [ -n "$sc_rootdir" ]
then osc_rootdir="$(/bin/readlink -f "$sc_rootdir/..")"
else osc_rootdir=~/.ox
fi
export osc_rootdir