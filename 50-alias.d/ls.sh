# edf is "eval directory or file"

alias ed='edf "ls -laht" "less -MFX"'
alias ev='edf "ls -laht" "view"'


# s means short, multicolumns
# l means long, monocolumn
alias s='ls -F'
alias l='ls -lF'

alias sa='s -a'
alias st='s -t'

alias la='l -a'
alias lh='l -h'
alias lt='l -t'
alias lf='l -d'

# ## Column display
# a l='ls -CF'   #!
# # a la='ls -A' #!
# a la='ls -CFa'
# a ld='ls -CFa'
# a lk='ls -CFH'
# ## Line per file display
# a ll='ls  -lF' #!
# a lla='ls -lFa'
# a lld='ls -lFd'
# a llh='ls -lFh'
# a llk='ls -lFH'
# a le='ls  -lF'
# a lef='ls -lFd'
# a leh='ls -lFh'
# a lek='ls -lFH'