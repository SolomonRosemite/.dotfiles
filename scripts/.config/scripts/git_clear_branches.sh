#!/usr/bin/env bash

p=$(mktemp)
git branch --merged | grep -v "\*" > $p

if [ ! -s $p ]; then
    echo "No branches found to clear. Exiting."
    exit 1
fi

nvim $p
if [ ! -s $p ]; then
    echo "No branches found to clear. Exiting."
    exit 1
fi

cat $p
read -p "Are you sure you would like to delete those branches? (y/n): " confirmation
if [[ "$confirmation" =~ ^[Yy]$ ]]; then
    xargs git branch -D < $p
    echo "Branches deleted."
else
    echo "Deletion cancelled."
fi
