#!/usr/bin/env bash

function gbw_prompt_branch {
    if [[ -z "$(git_get_current_branch)" ]]; then
        return
    fi

    echo "$C_LIGHT_YELLOW$(git_get_current_branch)$F_RESET"
}

function gbw_prompt_changes_count {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    echo "$C_LIGHT_YELLOW($(git_get_changes_nb))$F_RESET"
}

function gbw_prompt_status_to_be_commited {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_changes_to_be_committed_count)"
    local format="$C_LIGHT_GREEN"

    if [[ "$count" > 0 ]]; then
        format="$F_UNDERLINED$format"
    fi

    echo "${format}${count}c${F_RESET}"
}

function gbw_prompt_status_not_staged {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_changes_not_staged_for_commit_count)"
    local format="$C_LIGHT_RED"

    if [[ "$count" > 0 ]]; then
        format="$F_UNDERLINED$format"
    fi

    echo "${format}${count}!${F_RESET}"
}

function gbw_prompt_status_untracked {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local count="$(git_get_status_untracked_files_count)"
    local format="$C_LIGHT_RED"

    if [[ "$count" > 0 ]]; then
        format="$F_UNDERLINED$format"
    fi

    echo "${format}${count}!${F_RESET}"
}

function gbw_prompt_status {
    if [[ (-z "$(git_get_current_branch)") || ("$(git_get_changes_nb)" == 0) ]]; then
        return
    fi

    local c="$(gbw_prompt_status_to_be_commited)"
    local s="$(gbw_prompt_status_not_staged)"
    local u="$(gbw_prompt_status_untracked)"

    echo "$(gbw_implode " " \"$c\" \"$s\" \"$u\")"
}

function gbw_prompt_ps1 {
    local _TIME="$C_LIGHT_RED\t"
    local _USER="$C_LIGHT_GREEN$USER"
    local _HOST="$C_LIGHT_CYAN\h"
    local _DIR="$C_LIGHT_BLUE$(get_current_working_dir)"
    local _BRANCH="$(gbw_prompt_branch)"
    local _CHANGES_COUNT="$(gbw_prompt_changes_count)"
    local _STATUS="$(gbw_prompt_status)"

    local _AHEAD="$(git_status_ahead_count $(git_get_current_branch))↑"
    local _BEHIND_ALERT=""

    if [[ "$(git_status_behind_count)" > 0 ]]; then
        _BEHIND_ALERT="$C_ORANGE*$F_RESET"
    fi

    local _BEHIND="$_BEHIND_ALERT$(git_status_behind_count)↓"
    local _AHEAD_BEHIND="${C_LIGHT_GRAY}$_BEHIND $_AHEAD${F_RESET}"

    local _END="$_BEHIND_ALERT$F_RESET\$ "

    local user_host_implode="$(gbw_implode @ \"$_USER\" \"$_HOST\")"
    local ps1_implode="$_TIME $user_host_implode $_DIR $_BRANCH $_CHANGES_COUNT $_STATUS $_AHEAD_BEHIND"

    PS1="$ps1_implode\n$_END"
}

function gbw_prompt_ps2 {
    PS2="$C_CYAN>"
}

PROMPT_COMMAND='gbw_prompt_ps1'
gbw_prompt_ps2

