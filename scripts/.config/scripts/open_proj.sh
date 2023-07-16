#!/bin/bash

# Define the directories to search in
directories=("$HOME/dev" "$HOME/work")

# Search for directories using fzf
selected_dir=$(find ${directories[@]} -maxdepth 1 -type d 2>/dev/null | fzf)

# Check if a directory was selected
if [[ -n "$selected_dir" ]]; then
    cd $selected_dir
    $SHELL
    exit 0
fi

echo "No directory selected"
exit 1
