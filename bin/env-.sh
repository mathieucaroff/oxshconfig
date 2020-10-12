eval "$(/usr/bin/python ~/.ox/sc/shconf.py dash ~/.ox)"
exec env - HOME="$HOME" PATH="$PATH" TERM="$TERM" "$@"