#!/bin/dash

path() {
    # if [ $# -lt 1 ]
    # then set ':'
    # fi
    n='
'
    echo "$1$(replace ":" "$1$n$1" "$PATH")$1"
    # case "$sc_sh" in
    # dash) echo "$1$PATH$1" | sed "s%:%$1$n$1%g";;
    # *)    echo "$1${PATH//:/$1$n$1}$1";;
    # esac
}

path_reset() {
    PATH="$(/usr/bin/env -i /bin/sh -c 'echo $PATH')"
}

path_add() {
    for location
    do
        case ":$PATH:" in
        "*:$location:*") ;;
        *) PATH="$location:$PATH";;
        esac
        shift # Are you sure about this `shift`?
    done
}

path_proper() {
    PATH="$(replace "//" "/" "$PATH")"
    # case "$sc_sh" in
    # dash) PATH="$(echo "$PATH" | sed 's%//%/%g')";;
    # *)    PATH="${PATH//\/\//\/}";;
    # esac
}

path_nodup() {
    PATH="$(echo "$PATH" | nodup ":$1")"
}

path_checkdir() {
    keep_="="
    remove_="_"

    help='
Usage: path_checkdir [-v] [-K =] [-R _] [-i $'\n']

    -i ignore_this_path
Accept the specified path without checking the existence of the directory.
/!\ Beware, specifying it more than once will overwrite the preceding value.
I use it to keep single newlines in my $PATH.

    -v
Tell which directories are kept and which are removed.

    -K marker_keep_path
    -R marker_remove_path
Replace the default values (= for -K and _ for -R) used by -v to tell what is
kept and what is removed.
'

    while [ $# -gt 0 ]
    do
        case "$1" in
        "-v") verbose=t;;
        "-i") shift; ignore="i$1";;
        "-K") shift; keep_="$1";;
        "-R") shift; remove_="$1";;
        "-h"|"--help") echo "$help";;
        esac
        shift
    done

    local IFS=":"
    local P=""
    for dir in $PATH
    do
        if [ "i$dir" = "$ignore" ] || [ -d "$dir" ]
        then
            # If -v is provided, be verbose about what is kept (=) and
            # what is removed (_).
            if [ $verbose ]
            then echo "$keep_$dir"
            fi
            P="$P:$dir"
        else
            if [ $verbose ]
            then echo "$remove_$dir"
            fi
        fi
    done

    PATH="${P#:}"


    # ALTERNATIVE 2 #
    # /!\ IFS characters are stripped when using `read`
    # local IFS=''
    # /!\ Beware of pipes. They imply subshells
    # The usuall alternative is to use process substitution, but it
    # won't work with dash, so I used file descriptor redirections
    # instead.
    # {
    # PATH="$(echo "$PATH" | {
    # P=""
    # while read -r -d: dir
    # do
    #     if [ "i$dir" = "$ignore" ] || [ -d "$dir" ]
    #     then
    #         # If -v is provided, be verbose about what is kept (=) and
    #         # what is removed (_).
    #         if [ $verbose ]
    #         then echo "$keep_$dir" >&3
    #         fi
    #         P="$P:$dir"
    #     else
    #         if [ $verbose ]
    #         then echo "$remove_$dir" >&3
    #         fi
    #     fi
    # done
    # echo "${P:1}"; })"
    # } 3>&1


    # ALTERNATIVE 3 #
    # New implementation, using `for`
    # because `sh` does not support `read -d`

    # PATH="$(
    #     IFS=":"
    #     P=""
    #     for dir in $PATH
    #     do
    #         if [ "i$dir" = "$ignore" ] || [ -d "$dir" ]
    #         then
    #             # If -v is provided, be verbose about what is kept (=) and
    #             # what is removed (_).
    #             if [ $verbose ]
    #             then echo "$keep_$dir" >&3
    #             fi
    #             P="$P:$dir"
    #         else
    #             if [ $verbose ]
    #             then echo "$remove_$dir" >&3
    #             fi
    #         fi
    #     done
    #     echo "${P#:}";
    # )" 3>&1
}

path_pimp() {
    path_remove '
'
    PATH="$(path :)"
}

path_contain() {
    case "$PATH" in
        *"$1"*) true ;;
        *) false ;;
    esac
}

path_remove() {
    for location
    do
        local TMP=":$PATH:"
        TMP="${TMP//:$location:/:}"
        PATH="${TMP:1:$((${#TMP}-2))}"
        shift
    done
}

path_bump() {
    path_remove "$@"
    path_add "$@"
}