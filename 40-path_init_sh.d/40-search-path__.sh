#!/bin/dash

n='
'

osp() {
    osc_search_path
}

osc_search_path() {

    [ -z "$osc_rootdir" ] && osc_rootdir=~/.ox
    local H=~
    local R="${osc_rootdir}"
    echo "
$H/bin
$R/bin
/home/linuxbrew/.linuxbrew/bin
$H/.linxbrew/bin
$H/.brew/bin
$H/.cabal/bin
$H/.local/bin
$H/.local/.cabal/bin
$H/.cargo/bin
"

    # join_on "$n" ~/.local/share/*{,/*,/*/*}/bin
    # join_on "$n" ~/opt/*/sbin ~/opt/*/bin
    # join_on "$n"  /opt/*/sbin  /opt/*/bin

    # In bash, the star * expansion works inside barce expansion {} too.
    # You can test it:
    # ```
    # mkdir -p ~/.local/share/hi/bye/bin
    # osc_search_path | grep '/hi/'
    # rm -d ~/.local/share/hi/{bye/{bin/,},}
    # ```
    # However, brace expansion isn't supported in dash

    join_on "$n"\
        ~/.local/share/*/bin\
        ~/.local/share/*/*/bin\
        ~/.local/share/*/*/*/bin
    join_on "$n"\
        ~/opt/*/sbin\
        ~/opt/*/bin\
        /opt/*/sbin\
        /opt/*/bin

    # replace ":" "$n" "$PATH"
    path

    local DEFAULT_PATH="$(/usr/bin/env -i /bin/sh -c 'echo $PATH')"
    replace ":" "$n" "$DEFAULT_PATH"
    echo "
/usr/local/games
/usr/games
"
}
