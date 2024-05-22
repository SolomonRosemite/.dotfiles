#!/usr/bin/env bash

# Search for directories using fzf
directories="$@"
selected_dir=$(find ${directories[@]} -maxdepth 1 -type d -not -path '*/.*' 2>/dev/null | sort | fzf)

# Check if a directory was selected
if [[ ! -n "$selected_dir" ]]; then
    pwd
    exit 1
fi

echo $selected_dir
