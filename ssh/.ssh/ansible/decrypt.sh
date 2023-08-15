#!/bin/bash

# Directory containing the files to decrypt
directory="encrypted"

# Find all files in the directory
files=$(find "$directory" -mindepth 1)

for file in $files; do
    encrypted_file="${file}"

    decrypted_file="${encrypted_file%.encrypted}"
    decrypted_file="${decrypted_file#encrypted/}"
    decrypted_file="../${decrypted_file}"

    echo "Decrypting $encrypted_file to $decrypted_file"
    ansible-vault decrypt --output="$decrypted_file" "$encrypted_file"
done

