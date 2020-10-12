
echoexe() {
    echo "$@"
    "$@"
}

echox() {
    echo "$@"
    shift
    "$@"
}

runclear() {
    local linecount="$1"
    shift
    "$@"
    local IFS=" "
    printf '\n%.0s' $(eval echo {1..$linecount})
}