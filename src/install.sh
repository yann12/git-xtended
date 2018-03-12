#!/usr/bin/env bash

####################################
#              PROMPT              #
####################################

gbw_prompt_init_state="$GBW_PARAMS_OFF_C"

if [ "$GBW_PARAMS_PROMPT_INIT_ACTIVE" == 1 ]; then
    gbw_prompt_init
    gbw_prompt_init_state="$GBW_PARAMS_ON_C"
fi

echo -e "| Prompt with Git information                   | $gbw_prompt_init_state        |"

####################################
#           GIT ALIASES            #
####################################

if [ "$GBW_PARAMS_GIT_ALIASES_INIT_ACTIVE" == 1 ]; then
    gbw_git_aliases_enable
    gbw_git_aliases_init_state="$GBW_PARAMS_ON_C"
else
    gbw_git_aliases_disable
    gbw_git_aliases_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Git aliases                                   | $gbw_git_aliases_init_state        |"

####################################
#            GIT HOOKS             #
####################################

if [ "$GBW_PARAMS_GIT_HOOKS_INIT_ACTIVE" == 1 ]; then
    gbw_git_config_hooks_enable
    gbw_git_hooks_init_state="$GBW_PARAMS_ON_C"
else
    gbw_git_config_hooks_disable
    gbw_git_hooks_init_state="$GBW_PARAMS_OFF_C"
fi

echo -e "| Git hooks                                     | $gbw_git_hooks_init_state        |"

####################################
#          GIT WORKFLOW            #
####################################

echo -e "| Agile Git workflow commands                   | (wip)      |"