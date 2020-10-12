#!/bin/bash

"${0%/*}"/../bin/osc-bakrc.sh ~/.profile profile ""

[ -z "$osc_rootdir" ] && \
osc_rootdir="$("${0%/*}"/../bin/osc-rootdir.sh)"

echo '# /\ oxshconf
[ -z "$PS1" ] && return

osc_rootdir="'"$osc_rootdir"'"

case "$(ps ocomm= $$)" in
    -dash|dash|-sh|sh)
        eval "$(
            /usr/bin/python "$osc_rootdir/sc/shconf.py"\
            --shell dash\
            --directory "$osc_rootdir"\
        )"
        ;;
    -bash|bash)   source ~/.bashrc;;
    -zsh |zsh )   source  ~/.zshrc;;
esac
# \/ oxshconf
' >> ~/.profile