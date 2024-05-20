#!/usr/bin/env bash
# Credit: https://github.com/exosyphon/dotfiles/blob/5d6e87a583ff1ac9d244daed26d379627cd04592/scripts/fsb.sh

# Fuzzy search Git branches in a repo
# Looks for local and remote branches
function fsb() {
    SHELL=bash
    local pattern=$*
    local branches branch
    branches=$(git branch --all | awk 'tolower($0) ~ /'"$pattern"'/') &&
    branch=$(echo "$branches" |
            fzf-tmux -p --reverse --print-query)

    query="${branch%% *}"
    branch="${branch##* }"

    if [[ ! " $branches " =~ " $branch " ]]; then
        echo "Branch not found. Creating new branch $query"
        git checkout -b "$query"
        exit 0
    else
        git checkout "$branch"
    fi
}
fsb "$@"

