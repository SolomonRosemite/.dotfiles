#!/bin/bash

# Directory containing the files to encrypt
directory=".."

# Find all files in the directory
files=$(find "$directory" -maxdepth 1 -type f ! -name "known_hosts")

# Encrypt each file individually
for file in $files; do
    encrypted_file="${file#../}"
    encrypted_file="encrypted/${encrypted_file}.encrypted"
    echo $decrypted_file
    echo "Encrypting $file to $encrypted_file"
    ansible-vault encrypt --output="$encrypted_file" "$file"
done

