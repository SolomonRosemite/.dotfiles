#!/usr/bin/env bash

branches=$(git fetch -p && git branch -vv | awk '/: gone]/{print $1}')

if [ -z "$branches" ]; then
    echo "No branches to delete."
    exit 0
fi

echo "$branches"
read -p "Are you sure you would like to delete those branches? (y/n): " confirmation
if [[ "$confirmation" =~ ^[Yy]$ ]]; then
    echo "$branches" | xargs -n 1 git branch -D
    echo "Branches deleted."
else
    echo "Deletion cancelled."
fi
