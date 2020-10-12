#!/bin/bash
# Functions to easily start/kill the game Kingdom New Lands, as well as
# to manipulate the game save file

function kingdom-start {
    /etc/ox/p/o steam steam://run/496300
}

function kingdom-kill {
    /etc/ox/p/o xkill -id "$(xwininfo -name Kingdom | sed -nE 's/^.*?id: ([x0-f]*?) .*$/\1/p')"
}

function kingdom-show {
    (
    FILE=/tmp/kingdom.$RANDOM.buffer
    cd ~/.config/unity3d/noio/Kingdom
    python -mjson.tool storage_v34_AUTO.dat > $FILE
    for name 
    do echo "@$name" 
       grep -i -C 4 -A 34 "\"name\": \"${name}\"" $FILE
    done
    rm $FILE
    )
}

function kingdom-pos {
    (
    FILE=/tmp/kingdom.$RANDOM.buffer
    cd ~/.config/unity3d/noio/Kingdom
    python -mjson.tool storage_v34_AUTO.dat > $FILE
    for name 
    do echo "@$name" 
       (cat $FILE | grep -C 0 -B 11 "\"name\": \"$name("\
     || cat $FILE | grep -C 0 -B 11 "\"name\": \"$name P"
     ) | grep x | grep -E -v '"x": -?1.0,'
    done | sed -E 's/.*: //g'
    rm $FILE
    )
}

function kingdom-overview {
    kingdom-pos 'Beggar Camp' Statue\ {Archer,Farmer,Knight,Worker} Hermit\ House\ {Baker,Ballista,Knight} Portal Bridge
}

# function kingdom-restart {
#     (
#     cd ~/.config/unity3d/noio/Kingdom
#     kingdom-kill && kingdom-start
#     )
# }

# function kingdom-json {
#     (
#     FILE=/tmp/kingdom.$RANDOM.buffer
#     cd ~/.config/unity3d/noio/Kingdom
#     python -mjson.tool storage_v34_AUTO.dat > $FILE
#     cp $FILE storage_v34_AUTO.dat
#     rm $FILE
#     )
# }

# function kingdom-edit {
#     (
#     kingdom-json
#     cd ~/.config/unity3d/noio/Kingdom
#     vim storage_v34_AUTO.dat
#     )
# }
