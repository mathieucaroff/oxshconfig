#!/bin/bash

"${0%/*}"/../bin/osc-bakrc.sh ~/.zshrc zshrc zsh

[ -z "$osc_rootdir" ] && \
osc_rootdir="$("${0%/*}"/../bin/osc-rootdir.sh)"

echo '
# /\ oxshconf
[ -z "$PS1" ] && exit

osc_rootdir="'"$osc_rootdir"'"

source <(
    /usr/bin/python "$osc_rootdir/sc/shconf.py"\
        --shell zsh\
        --directory "$osc_rootdir"\
)
# \/ oxshconf
' >> ~/.zshrc