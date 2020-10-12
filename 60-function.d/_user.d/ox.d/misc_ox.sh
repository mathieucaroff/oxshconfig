
cdl() { # Move to a dir and list the content.
    if [ -n "$1" ]
    then cd "$@"
    else true
    fi && ls --color=always -CFa | seddo
}

mv_() { # Rename the current dirctory, returning in it immidiately
    wd="$(basename "$(pwd)")"
    cd ..
    mv "${wd}" "$1"
    cd "$1"
}

mdcd() { # Make a dir and move into it.
    # Don't do anything if no argument is passed.
    [ -n "$*" ] && mkdir -p "$@" && cd "$@"
}

cdh() { # Move to a dir in home
    pushd ~
    cd "$@"
}

cdhl() { # cdh and list the content
    if [ -n "$1" ]
    then cdh "$@"
    else true
    fi && ls --color=always -CFa | seddo
}

c() {
    popd
}

hyg() {
    history | grep "$@" | awk '!a[substr($0, index($0,$3))]++'
}
