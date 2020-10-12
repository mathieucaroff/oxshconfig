#!/bin/bash

# osc-make

osc-fail() {
    echo "$@"
    exit 4
}
mustMake=''

target="$1"

if [ "$2" != "--with" ]
then osc-fail 'osc-make: Second argument must be `--with`'
fi
shift 2;

while [ "$1" != "--by-running" ] && (("$#" > 2))
do
    dependency="$1"
    if [ "$target" -ot "$dependency" ]
    then
        mustMake=t
    fi
done

if [ "$1" != "--by-running" ] || [ "$#" != "2" ]
then osc-fail 'osc-make: One before last argument must be `--by-running`'
fi

command="$2"

if [ $mustMake ] {
    $command
}