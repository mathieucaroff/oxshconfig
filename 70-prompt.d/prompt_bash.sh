prompt_set() {
    # For bash
    # N="$(printf "\[\e[0")" # Normal
    # B="$(printf "\[\e[1")" # Bold
    # E="$(printf "m\]")"    # End
    N=$'\[\e[0' # Normal
    B=$'\[\e[1' # Bold
    E=$'m\]'    # End
    # For zsh
    # N='\e[0'
    # B='\e[1'
    # E='m'
    C="$N$E" # Clear
    if [ "$(whoami)" != "root" ] ; then
        local USER_="$B;32$E\u"
        local AT_="$N;36$E@"
        local HOST_="$B;36$E\h"
        local DATE_="$N;93$E%Hh%M$C"
        local RETCODE_="$N;91$E:\$R$C"
        local RETCODE__='$(R="$?";[ "$R" != "0" ] && echo "'"$C $RETCODE_"'")'
        local DATE_RETCODE_="\$(date \"+$DATE_$RETCODE__\")"
        local PWD_="$B;34$E\$(\
SHORT_PWD=\"\${PWD/~/'~'}\";\
[ \"\$SHORT_PWD\" == '~' ] && echo '~' ||\
sed -Ee 's^(\\\\W\\\\w{,3})\\\\w*^\\\\1^g;N;s_\\\\n_/_g'\
<<< \"\${SHORT_PWD%/*}
\${SHORT_PWD##*/}\")"
        if false && pstree -s $$ &>/dev/null; then
            # /!\ Computed only once /!\
           local DEPTH_="$N;37$E/$(pstree -s $$ | grep -o sh- | tail -n +2 | wc -l)"
        else
           local DEPTH_="$N;37$E/${SHLVL}"
        fi
        export PS1="$USER_$AT_$HOST_$DEPTH_$C $DATE_RETCODE_$C $PWD_$C ${sc_sh:0:1}\\\$ "
    else
        # ROOT
        export PS1="$B;31$E\\\$@\h$C:$B;34$E\w$C ${sc_sh:0:1}\\\$ "
    fi
}



prompt_set
