
COMPLETION0="/usr/share/bash-completion/bash_completion"
COMPLETION1="/etc/bash_completion"
if ! shopt -oq posix; then
  if [ -f "$COMPETION0" ]; then
      . "$COMPLETION0"
  elif [ -f "$COMPLETION1" ]; then
      . "$COMPLETION1"
  else
      NOCOMPLETION=t
  fi
fi

if [ $NOCOMPLETION ]; then
    true
else
    _init_completion
    _completion_loader man
    _completion_loader aptitude

    complete -F _command g gg # g and gg are the only scripts of "~/j/s" that takes arguments

    complete -F _man m hman

    complete -b h # h is the alias of help. # I don't know how it work. I found it with "complete -p". Anyway, it works.

    complete -F _root_command s sg kds gks oks ogs
    complete -F _aptitude P Pr
    complete -o default -o nospace -F _aptitude Padd


    _ppa_lists () {
        local cur
        _init_completion || return

        COMPREPLY=( $( find /etc/apt/sources.list.d/ -name "*$cur*.list" \
    -exec basename {} \; 2> /dev/null ) )
        return 0
    }
    complete -F _ppa_lists update-repo
fi
