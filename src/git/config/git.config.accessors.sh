#!/usr/bin/env bash

# TODO: create test
function gwb_git_config_get {
    local key=$1
    local default=$2

    local value="`git config --global ${key}`"

    if [ "${value}" == "" ]; then
        echo "${default}"
        return
    fi

    echo "${value}"
}

# TODO: create test
function gwb_git_config_set {
    git config --global $1 $2
}

function gbw_git_config_set_global_alias_cmd {
    local name="$1"
    shift

    git config --global alias.$name \"$*\"
}

function gbw_git_config_set_global_alias_func_cmd {
    git config --global alias.$1 "\"!f() { $2; }; f\""
}

function gbw_git_config_set_global_alias_sh_cmd {
    git config --global alias.$1 "!sh -c $2"
}