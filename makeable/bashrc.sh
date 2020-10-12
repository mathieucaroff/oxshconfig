#!/bin/bash

"${0%/*}"/../bin/osc-bakrc.sh ~/.bashrc bashrc bash

[ -z "$osc_rootdir" ] && \
osc_rootdir="$("${0%/*}"/../bin/osc-rootdir.sh)"

echo '
# /\ oxshconf
[ -z "$PS1" ] && exit

osc_rootdir="'"$osc_rootdir"'"

source <(
    /usr/bin/python "$osc_rootdir/sc/shconf.py"\
        --shell bash\
        --directory "$osc_rootdir"\
)
# \/ oxshconf
' >> ~/.bashrc