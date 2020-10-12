prompt_reset() {
    export PS1='$(whoami)@$(hostname):$PWD d\$ '
}