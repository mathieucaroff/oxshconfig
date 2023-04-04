if declare -Ff __git_ps1 >/dev/null; # "if __git_ps1 is a function"
then : # do nothing
else
source /usr/share/git-core/contrib/completion/git-prompt.sh || true
fi

prompt_set_mca() {
    OLD_PS1="$PS1"

    prompt_set_with_git # set the GIT_PS1_* variables

    local C="\[\e[0m\]" # "clear" (no color)
    local DARK="\[\e[30;1m\]"
    local GREEN="\[\e[32;1m\]"
    local YELLOW="\[\e[33;1m\]"
    local BLUE="\[\e[34;1m\]"
    local CYAN="\[\e[36;1m\]"

    PS1=""
    PS1+="$DARK[\t]$C " # time

    PS1+="$GREEN\$(whoami)@" # username
    PS1+="\$(hostname)$C:" # hostname
    PS1+="$YELLOW\$(pwd)$C" # working directory

    declare -Ff __git_ps1 >/dev/null && \
    # git
    PS1+="\$(__git_ps1 ' $BLUE[%s \$(git stash list | wc -l)]$C')" # git status - git stash count

    PS1="\$(R=\$?; echo \"$PS1$CYAN\$(printf '%2X' \$R)\")$C" # return code
    PS1+="$YELLOW\${PROXY_MARKER}" # proxy
    PS1+="$CYAN""b" # shell name letter (b for bash)
    PS1+="\${SHLVL}" # shell level
    PS1+="\$$C " # roothash
}

prompt_set_simple() {
    PS1="[\t] \u@\h:\w \$ "
}

prompt_set_with_git() {
    # cat "$(locate git-prompt.sh -n 1)" | grep -Eo 'GIT_PS1_[A-Z_]*' | sort | uniq
    : GIT_PS1_DESCRIBE_STYLE
    GIT_PS1_SHOWCOLORHINTS=t
    GIT_PS1_SHOWDIRTYSTATE=t
    GIT_PS1_SHOWSTASHSTATE=t
    GIT_PS1_SHOWUNTRACKEDFILES=t
    GIT_PS1_SHOWUPSTREAM=t

    PS1="[\t] \u@\h:\w\$(__git_ps1 ' [%s]') \$ "
}

prompt_set_ox() {
    ## Colors ##
    # For bash #
    # N="$(printf "\[\e[0")" # Normal
    # B="$(printf "\[\e[1")" # Bold
    # E="$(printf "m\]")"    # End
    local N=$'\[\e[0' # Normal
    local B=$'\[\e[1' # Bold
    local E=$'m\]'    # End
    # For zsh #
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
        export PS1="$USER_$AT_$HOST_$DEPTH_$C $DATE_RETCODE_$C $PWD_$C b\\\$ "
    else
        # ROOT
        export PS1="$B;31$E\\\$@\h$C:$B;34$E\w$C b\\\$ "
    fi
}
