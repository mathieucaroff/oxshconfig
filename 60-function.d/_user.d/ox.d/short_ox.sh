val() {
    eval echo \$\{$1\}
}

math() {
    maxima -q --batch-string "$@ ;"
}

gr() {
    grep "$@" -R .
}