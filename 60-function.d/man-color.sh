
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;35m")\
    LESS_TERMCAP_md=$(printf "\e[1;32m")\
    LESS_TERMCAP_me=$(printf "\e[0m")\
    LESS_TERMCAP_se=$(printf "\e[0m")\
    LESS_TERMCAP_so=$(printf "\e[7;40m")\
    LESS_TERMCAP_ue=$(printf "\e[0m")\
    LESS_TERMCAP_us=$(printf "\e[1;33m")\
    /usr/bin/man "$@";
}