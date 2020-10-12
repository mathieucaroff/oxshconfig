#!/bin/dash

# so:/a/23673883/2514354
join_on() {
    # $1 is sep
    # $2... are the elements to join
    # return is in global variable join_ret
    local sep=$1 IFS=
    join_ret=$2
    shift 2 || shift $(($#))
    echo "$join_ret${*/#/$sep}"
}

join_on() {
    local IFS=$1
    shift
    echo "$*"
}