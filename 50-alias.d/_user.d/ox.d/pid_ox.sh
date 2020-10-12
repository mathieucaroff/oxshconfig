
alias gtop='o gnome-system-monitor'
alias ktop='o ksysguard'
alias xtop='o xfce4-taskmanager'

alias xpid='xprop _NET_WM_PID | cut -d" " -f3'
alias xwintop='top -p $(xpid)'

alias pn='ps -eo pcpu,pid,user,args | sort -nk 1 -r | head -10'