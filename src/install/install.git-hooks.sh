#!/usr/bin/env bash

function gbw_install_git_hooks {
    local hookspath_available="$(gbw_is_good_version "`gbw_git_get_current_version`" "${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN}")"

    if [[ "${hookspath_available}" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_install_git_hooks_corehookspath_create
        return
    fi

    gbw_install_git_hooks_corehookspath_not_available
    gbw_install_git_hooks_symlink
}

function gbw_install_git_hooks_corehookspath_create {
    gbw_print_step "'git config core.hooksPath' available"
}

function gbw_install_git_hooks_corehookspath_not_available {
    gbw_print_step "'git config core.hooksPath' NOT available ! Git version ${GBW_PARAMS_GIT_HOOKSPATH_VERSION_MIN} is at least required (current version: `gbw_git_get_current_version`)"
}

function gbw_install_git_hooks_symlink {
    local current_hooks_prepare_commit_msg_path="${PWD}/.git/hooks/prepare-commit-msg"
    local command_create_symlink="ln -sf ${GBW_PARAMS_HOOKS_PREPARE_COMMIT_MSG_PATH} ${current_hooks_prepare_commit_msg_path}"

    gbw_print_step "Create symlink instead ($ ${command_create_symlink})"

    if [[ "`gbw_symlink_exists "$current_hooks_prepare_commit_msg_path"`" == "${GBW_PARAMS_TRUE}" ]]; then
        gbw_install_git_hooks_symlink_remove "${current_hooks_prepare_commit_msg_path}"
        return
    fi

    gbw_install_git_hooks_symlink_create "${current_hooks_prepare_commit_msg_path}"
}

function gbw_install_git_hooks_symlink_create {
    local current_hooks_prepare_commit_msg_path="${1}"
    local pcm_symlink_command_delete="rm ${current_hooks_prepare_commit_msg_path}"

    gbw_print_question_yes_no "Create hooks symlink"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        eval "${command_create_symlink}"
        gbw_print_step "Symlink created"
        return
    fi

    gbw_print_step "Symlink does not create !"
}

function gbw_install_git_hooks_symlink_remove {
    local current_hooks_prepare_commit_msg_path="${1}"
    local pcm_symlink_command_delete="rm ${current_hooks_prepare_commit_msg_path}"

    gbw_print_question_yes_no "Remove hooks symlink"

    if [[ "${_GBW_PRINT_QUESTION_YES_NO_LAST_VALUE}" == "${GBW_PARAMS_YES}" ]]; then
        eval "${pcm_symlink_command_delete}"
        gbw_print_step "Symlink removed"
        return
    fi

    gbw_print_step "Symlink does not remove !"
}