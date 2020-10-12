#!/bin/bash

osc_rootdir=$(osc-rootdir.sh)

if [ $1 ]
then
    shell="$1"
else
    shell="$(ps ocomm= $PPID)"
fi

/usr/bin/python "$osc_rootdir/sc/shconf.py"\
    --shell "$shell"\
    --directory "$osc_rootdir"