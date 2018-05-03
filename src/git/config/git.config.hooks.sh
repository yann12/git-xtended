#!/usr/bin/env bash

function gbw_git_config_hooks_set {
    local global="$1"
    [[ "${global}" != "--global" ]] && global=""

    git config $global core.hooksPath "${GBW_PARAMS_GIT_HOOKS_DIR}"
}

function gbw_git_config_hooks_unset {
    local global="$1"
    [[ "${global}" != "--global" ]] && global=""

    git config $global --unset core.hooksPath
}

function gbw_git_config_hooks_enabled {
    gbw_git_config_hooks_set --global
}

function gbw_git_config_hooks_disabled {
    gbw_git_config_hooks_unset --global
}

function gbw_git_config_hooks_set_type_hookspath {
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_TYPE}" "${GBW_PARAMS_GIT_HOOKS_TYPE_HOOKSPATH}"
}

function gbw_git_config_hooks_set_type_symlink {
    gwb_git_config_set "${GBW_PARAMS_GIT_CONFIG_KEY_GIT_HOOKS_TYPE}" "${GBW_PARAMS_GIT_HOOKS_TYPE_SYMLINK}"
}