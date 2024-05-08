#!/bin/bash

read -p "Input: " json
echo $json | jq | utf8clip.exe
echo "copied to clipboard"
