#!/bin/dash

n='
'

seddots() {
    sed -n '1,15p;:a;31i(...)'"$n"'$bz;16,$N;31,$D;16,$ba;:z;16,$p'
}

seddot() {
    sed -n '1,7 p;:a;15i(...)'"$n"'$bz;8,$ N;15,$ D;8,$ ba;:z;8,$ p'
}

seddo() {
    sed -n '1,3 p;:a;7 i(...)'"$n"'$bz;4,$ N;7,$ D;4,$ ba;:z;4,$ p'
}

case "$sc_sh" in
dash)
    replace() {
        bash -c "echo "'"${3//"$1"/"$2"}"' '' "$@"
    }
;;
*)
    replace() {
        pat="$1"
        rpl="$2"
        text="$3"
        echo "${text//"$pat"/"$rpl"}"
    }
;;
esac