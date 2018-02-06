#!/usr/bin/env bash

function git_apply_global_config {
    # git branch
    git config --global alias.b branch

    # git commit
    git config --global alias.c "commit -m"
    git config --global alias.amend "commit -m --amend"

    # git checkout
    git config --global alias.co checkout

    # git log
    git config --global alias.l "log -12 --graph --oneline --decorate --date=short --pretty=format:'%C(yellow)%h %C(cyan)%ar %C(auto,green)%<(9,trunc)%aN%Cred%d %Creset%s'"
    git config --global alias.ll "log --graph --oneline --decorate --date=short --pretty=format:'%C(yellow)%h %C(cyan)%ar %C(auto,green)%<(9,trunc)%aN%Cred%d %Creset%s'"

    # git reset
    git config --global alias.rrr "reset --hard HEAD"

    # git status
    git config --global alias.s "status -s"
    git config --global alias.ss status
}

function git_get_current_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function git_get_changes_nb {
    git status --porcelain 2> /dev/null | wc -l
}

function git_diff_current_branch_origin_dev {
    git diff --stat origin/dev 2> /dev/null
}