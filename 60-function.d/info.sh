ifs() {
    (printf '%s' "IFS=$'$IFS'" | tr '\t\n' tn | sed 's/[tn]/\\\0/g;s/$/\n/')

    # (printf '%s' "IFS=$'$IFS'" | tr '\t\n' tn | sed 's/[tn]/\\\0/g'); echo

    # printf "IFS=$'%s'\n" "$(printf %s "$IFS" | tr '\t\n' tn | sed 's/[tn]/\\\0/g')"

    # set | grep --color=none '^IFS='

    # echo -n "$IFS." | tr ' \t\n' 'stn'; echo

    # python -c "print('''IFS=$'$IFS'''.replace('\t', 't').replace('\n', 'n'))"

    # python -c "print reduce(lambda s, kv: s.replace(*kv), ' s,\tt,\nn'.split(','), '''$IFS.''')"
}

argcount() {
    echo $#
}