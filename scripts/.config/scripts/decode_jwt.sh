#!/usr/bin/env bash

read -p "Input: " input
# https://www.pgrs.net/2022/06/02/simple-command-line-function-to-decode-jwts/
result=$(jq -R 'split(".") |.[0:2] | map(gsub("-"; "+") | gsub("_"; "/") | gsub("%3D"; "=") | @base64d) | map(fromjson)' <<< $input)

if [ "$1" == "--clip" ]; then
    echo $result | jq | utf8clip.exe
    echo "copied to clipboard"
    exit 0
fi

echo $result | jq

