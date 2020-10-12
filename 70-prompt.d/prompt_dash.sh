prompt_set() {
    N="$(printf "\e[0")" # Normal
    B="$(printf "\e[1")" # Bold
    E="$(printf "m")"  # End
    # N='\e[0'
    # B='\e[1'
    # E='m'
    C="$N$E" # Clear
    if [ "$(whoami)" != "root" ] ; then
        local USER_="$B;32$E\$(whoami)"
        local AT_="$N;36$E@"
        local HOST_="$B;36$E\$(hostname)"
        local AT_="$N;36$E@"
        local DATE_="$N;93$E%Hh%M$C"
        local RETCODE_="$N;91$E:\$R$C"
        local RETCODE__='$(R="$?";[ "$R" != "0" ] && echo "'"$C $RETCODE_"'")'
        local DATE_RETCODE_="\$(date \"+$DATE_$RETCODE__\")"
        local PWD_="$B;34$E\$(pwd | sed -Ee \"s:^$HOME:~:\" -e 's_(\W\w{,3})\w*_\1_g')"
        if pstree -s $$ >/dev/null 2>&1; then
           local DEPTH_="$N;37$E/"'$(pstree -s $$ | grep -o sh- | tail -n +2 | wc -l)'
        else
           local DEPTH_="$N;37$E/"'${SHLVL}'
        fi
        export PS1="$USER_$AT_$HOST_$DEPTH_$C $DATE_RETCODE_$C $PWD_$C ${sc_sh}\\\$ "
    else
        # ROOT
        export PS1="$B;31$E\\\$@\h$C:$B;34$E\$PWD$C ${sc_sh}\\\$ "
    fi
}

prompt_set