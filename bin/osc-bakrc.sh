#!/bin/bash

# Move a file to the "rc" directory.
# If the given "shell" parameter is valid, it will still be executed for that shell.

target="$1"
destName="$2"
shell="$3"

destinationDir="${0%/*}/../05-rc_sh.d"
dst="$destinationDir/$destName"
dst="$dst-$(date "+%Y-%m-%d")--${RANDOM::3}"
dst="${dst}_$shell.sh"

if [ -e "$target" ]
then
    mkdir -p "$destinationDir"

    mv "$target" "$dst"
fi