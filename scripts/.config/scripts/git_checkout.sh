#!/bin/bash

refs=$(git for-each-ref --format='%(refname:short)')
branches=($(echo "$refs" | awk -F '/' '/(remotes\/origin\/|origin\/)/ && !/HEAD$/ {gsub(/(remotes\/origin\/|origin\/)/, "", $0); print $0}' | sort -u))

query=$(echo "${branches[@]}" | tr ' ' '\n' | fzf --print-query)

q=$(echo "$query" | head -1)
branch=$(echo "$query" | tail -1)

if [[ " ${branches[*]} " == *" $branch "* ]]; then
    git checkout $branch
    exit 0
fi

echo "Branch not found. Creating new branch $q"
git checkout -b "$q"
