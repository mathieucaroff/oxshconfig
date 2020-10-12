undoox() {
    # unsetproxy

    local oIFS="$IFS"
    IFS=$'\n'

    read -rd$'\e' rctext < "$(cat ~/.mca/{.bashrc,prompt_bash.sh})"
    unset -f $(echo "$rctext" | sed -E 's/^([a-zA-Z0-9_-]+)\(\) \{.*$/\1/;t;d')

    unalias $(echo "$rctext" | sed -E 's/^alias ([a-zA-Z0-9_-]+)=.*$/\1/;t;d')

    for varname in $(set | sed -E $'s/^OLD_([A-Z0-9_]+).*/\\1/;t;d'); do
        indirect=OLD_$varname
        $varname="${!indirect}"
    done

    unset "$(set | sed -E $'s/^(GIT_PS1_[A-Z0-9_]+).*/\\1/;t;d')" \
        AIRFLOW_HOME

    IFS="$oIFS"
}
