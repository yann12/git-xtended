#!/usr/bin/env bash

GBW_PARAMS_FALSE="false"
GBW_PARAMS_TRUE="true"

GBW_PARAMS_ON="on"
GBW_PARAMS_OFF="off"

GBW_PARAMS_ON_C="${C_LIGHT_GREEN}on ${F_RESET}"
GBW_PARAMS_OFF_C="${C_LIGHT_RED}off${F_RESET}"

GBW_PARAMS_USER_PS1="\u"
GBW_PARAMS_ROOT="~/git-bash-workflow"

GBW_PARAMS_GIT_ALIAS_DIFF_FILE="$GBW_PARAMS_ROOT/src/git/alias/git.alias.diff.sh"
GBW_PARAMS_GIT_ALIAS_COMMIT_FILE="$GBW_PARAMS_ROOT/src/git/alias/git.alias.commit.sh"
GBW_PARAMS_GIT_ALIAS_STATUS_FILE="$GBW_PARAMS_ROOT/src/git/alias/git.alias.status.sh"

GBW_PARAMS_GIT_HOOKS_DIR="$GBW_PARAMS_ROOT/git/hooks/"

# Change local
#if [ -z ${LC_ALL+x} ]; then
#    echo "# LC_ALL is unset > export LC_ALL=C"
#    export LC_ALL=C
#else
#    echo "# LC_ALL is set to '$var'"
#fi

GBW_PARAMS_GIT_REMOTE_BRANCH_REF=""
GBW_PARAMS_GIT_ALIASES_INIT_ACTIVE=1
GBW_PARAMS_GIT_HOOKS_INIT_ACTIVE=1

GBW_PARAMS_PROMPT_INIT_ACTIVE=1

