#!/bin/bash

read -p "Input: " json
echo $json | jq | clip.exe
echo "copied to clipboard"
