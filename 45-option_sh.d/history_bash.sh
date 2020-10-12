#!/bin/dash

# don't put duplicate lines or lines starting with space in the history.
# CSV of ignorespace,ignoredups,ereasedups
# ignoreboth is special value
HISTCONTROL=ignorespace,ereasedups

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=5000
HISTFILESIZE=90000

HISTTIMEFORMAT="%Y-%m-%d--%T "

HISTIGNORE="cd,ls,ls -l, ls -la"