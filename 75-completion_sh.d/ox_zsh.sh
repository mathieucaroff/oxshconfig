zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

autoload -Uz compinit
compinit -u


if compdef o=command &>/dev/null; then
    autoload bashcompinit

    function _ppa_list {
        local cur
        # _init_completion || return

        COMPREPLY=( $( find /etc/apt/sources.list.d/ -name "*$cur*.list" \
    -exec basename {} \; 2> /dev/null ) )
    }

    # complete -F _ppa_list update-repo
    #compdef update-repo=_ppa_list_zsh

    compdef o=command
    compdef oo=command

    compdef whicat=command
    compdef whill=command
fi