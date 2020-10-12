Aw() { # apt-which
    dpkg -S "$(/usr/bin/which "$@")"
}

apt_list_raw() {
    dpkg -L "$@" | grep -E '/(games|s?bin)/[^/]*$'
}

Ale() { # List (most) executables installed by a package
    # Pass --location or -l as first parameter to also show the location of the executable

    # Old:
    # dpkg -L "$@" | \
    # while read -r path
    # do
    #     if dirname "$path" | grep -Eq '/(games|s?bin)$'
    #     then basename "$path"
    #     fi
    # done

    case "$1" in
        "--location"|"-l")
            shift
            apt_list_raw "$@" | sed -E 's_^(.*)/([^/]+)$_(\1) \2_'
        ;;
        *)  apt_list_raw "$@" | grep --color=no -Eo '([^/]+)$';;
    esac
}