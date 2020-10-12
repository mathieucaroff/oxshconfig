# aa() { # See `fucat` function too
# if [[ "x$*" == "x" ]]
# then alias
# elif alias | grep "\(^\| \)$1=" &>/dev/null
#  # If $@ is an alias, find it.
# then alias "$1"
# elif [[ -f "$P/$1" ]]
# then cat "$P/$1" && echo
# else
#   FOUND= fucat "$1"
#   if [[ $? == "0" ]]
#   then echo $FOUND
#   elif man "$1" &>/dev/null
#   then man "$1"
#   elif [[ -f "/etc/ox/p/ro/$1" ]]
#   then dv "/etc/ox/p/ro/$1"
#   elif [[ -f "/etc/ox/g/$1" ]]
#   then dv "/etc/ox/g/$1"
#   elif [[ -f "/etc/ox/g/hif/$1" ]]
#   then dv "/etc/ox/g/hif/$1"
#   fi
# fi
# }


# v Probably became a script
# findcat() {
#   if [ -z "$*" ]
#   then set -- .
#   fi
#   HEADER_PREFIX="
# #~ FINDCAT[$RANDOM] --"
#  #find -H "$@" -type f -exec grep -Iq . {} \; -and -exec bash -c 'cat <(echo) <(echo "FILE -- {}") {}' \;
#   find -H "$@" -type f -exec grep -Iq . {} \; -and -exec echo "${HEADER_PREFIX}{}" \; -exec cat "{}" \;
# }


# Actually, I think all those function below became scripts
# vimch() {
#     READLINK="$(readlink -f "$(/usr/bin/which $1)")"
#     STATUS="$(file --mime-type "$READLINK")"
#     if grep "text" <<< "$STATUS" > /dev/null 2>&1
#     then vim "$READLINK"
#     else echo "$READLINK"
#     fi
# }

# fucat() {
#     regex='\\{.*?^\\}'
#     python3 -c "import re ; m = re.search('function $* $regex',open('/etc/ox/g/functions').read(),re.M|re.S); print(m.group() if m else None)"
# }

# whicat() {
#     cat $(/usr/bin/which "$@") ; echo
# }

# whill() {
#     ls -l $(/bin/which "$@")
# }

# sapidl() {
#   if [ sudo fuser /var/lib/dpkg/lock ]
#   then sudo apt-get -o Debug::NoLocking=1 -d install "$@"
#   else sudo apt-get install "$@"
#   fi
# }