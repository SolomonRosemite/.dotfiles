#!/usr/bin/env bash

# Define the directories to search in
directories="$@"
# directories=("$HOME/dev" "$HOME/work")

# Search for directories using fzf
selected_dir=$(find ${directories[@]} -maxdepth 1 -type d -not -path '*/.*' 2>/dev/null | fzf)

# Check if a directory was selected
if [[ ! -n "$selected_dir" ]]; then
    echo "No directory selected"
    exit 1
fi

echo $selected_dir
