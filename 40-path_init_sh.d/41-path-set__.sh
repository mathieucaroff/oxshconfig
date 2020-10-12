#!/bin/dash

path_bloat () {
    PATH="$(osc_search_path | tr '\n' ':')"
}

path_sane () {
    path_bloat

    path_proper

    path_nodup

    path_checkdir
}