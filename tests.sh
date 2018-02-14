#!/usr/bin/env bash

###################
# START TEST MODE #
###################

GBW_TESTS_MODE=1

echo "#############################"
echo "# Git Bash Workflow TESTING #"
echo "#############################"
echo

alias git="gbw_tests_fake_git"

source ~/git-bash-workflow/gbw.sh

source ~/git-bash-workflow/src/gbw.test.sh

source ~/git-bash-workflow/test/gbw.prompt.tests.sh
source ~/git-bash-workflow/test/gbw.git.tests.sh
source ~/git-bash-workflow/test/gbw.utils.tests.sh

gbw_tests_run_all

unalias git
unset GBW_TESTS_MODE

####################
# FINISH TEST MODE #
####################

echo
echo -e "${C_LIGHT_YELLOW}[ Reload original Git Bash Workflow ! ]${F_RESET}";

source ~/git-bash-workflow/gbw.sh
