#!/bin/bash

cmdname="$1"
cmd="$2"

if which "$cmdname" >/dev/null 2>&1
then
    eval "$cmd"
fi