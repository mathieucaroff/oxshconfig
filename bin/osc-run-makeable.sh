#!/bin/bash

# osc-run-makeable

for f in ~/.ox/makeable/*
do $f
done

while [ "$1" ]
do  case "$1" in
        "rm") rm -r "${0%/*}/../05-rc_sh.d";;
        "head") head ~/.profile;;
    esac
    shift
done