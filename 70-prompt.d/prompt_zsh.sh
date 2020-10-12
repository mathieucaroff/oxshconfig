#!/usr/bin/zsh
# ztheme
# Set the prompt
# 

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN="c"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"


prompt_set() {

local user='%(#.$fg[red].$fg[green])%B%n%b%(#.$fg[magenta].$fg[cyan])@%B%m%b'
local df='$(df --output=pcent . | sed -En "s/.([0-8])[0-9]%|.(9[0-9])%/>\1\2/p")'
if false && pstree -ls $$ &>/dev/null; then
    local depth='$FG[007]/$(pstree -s $$ | grep sh- -o | tail -n +2 | wc -l)' # 007 is grey # 013 is purple
else
    local depth='$FG[007]/${SHLVL}'
fi
# Use
#     for i in {000..255}; do echo "$i $FG[$i]I'm text\e[00m" ; done | less
# to see all zsh's prompt colors
local time='$FG[011]$(date -u +u%Hh%M)%b' # 011 is dark yellow
local entry='$fg[white](%i@%h)%b'
local pwd='$fg[blue]%B%~%b'
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%b'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%b'
  fi
fi
local return_code='%(?.. %{$fg[red]%}:%?%b)'
local battery=''
if which acpi &>/dev/null; then
  function battery_f {
		local a="$(acpi)"
		local trend="$(echo "$a" | grep -Eo '(Charging|Full|Discharging|Unknown)')"
		local load="$(echo $a | sed -Ee 's/.* ([0-9]+)%.*/\1/')" # %% -> %
		local l=''
		case "$trend" in
			Full)        l='–';;
			Charging)    l='/';;
			Discharging) l='\\';;
            Unknown)     l='?';;
			*)           l='!unexpected acpi status!';;
		esac
		local remainingtime=''
		if [ "$trend" != "Full" ] && [ "$trend" != "Unknown" ]; then
			remainingtime="$(echo $a | sed -E 's/.* [10]([0-9]):([0-9]).*/\1\2/')"
		fi
		echo "$load$l$remainingtime"
  }
	battery=" $FG[028]"'$(battery_f)%b' # 028 is dark green
fi
local git_branch='$(git_prompt_status)%b$(git_prompt_info)%b'


#####

# LINE1="${user} ${entry} ${time} ${pwd}"
# ENDL1="${return_code} ${git_branch} ${rvm}"
LINE1="${user}${depth} ${entry} ${time}${battery}${return_code} ${df}${pwd}"
ENDL1=""
LINE2='%(#.%{$fg[red]%}%B#.$)%b '

#####

# Main
PROMPT="$LINE1
$LINE2"
RPROMPT="$ENDL1"

# Unfinished command
PROMPT2='$fg[red]%_\ %b'

}

prompt_set