# Minimum value
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31' # :ow=1;33

osc-ifwhich.sh dircolors 'eval "$(dircolors -b)"'
LS_COLORS="$LS_COLORS:ow=1;33"
export LS_COLORS