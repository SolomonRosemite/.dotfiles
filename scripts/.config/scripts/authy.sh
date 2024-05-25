#!/usr/bin/env bash

which authy-export > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "Looks like \"github.com/alexzorin/authy\" is not installed. It can be manually installed via \"go install github.com/alexzorin/authy/...@master\""
    echo "DO NOT install via \"go install github.com/alexzorin/authy/...@latest\" since the latest tag is outdated and this script requires the following commit:"
    echo "https://github.com/alexzorin/authy/commit/c4f25fd60cd32868a7f42265e6687ca7989feed8"
    read -p "Should it be installed for you? (golang required) (y/n): " confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        go install github.com/alexzorin/authy/...@master
    else
        echo "canceled."
        exit 1
    fi
fi

set -e
clean_up () {
    ARG=$?
    rm $HOME/authy-go.json > /dev/null 2>&1
    exit $ARG
} 
trap clean_up EXIT

file="$HOME/.authy.json"
if [[ $1 = "--save" ]]; then
    echo "Save to $file"
    authy-export -save "$file"
    chmod 600 $file
    echo "Saved TOTP encrypted database to $file"
    exit 0
fi

delimiter="=========="
pairs=$(cat "$file" | jq --arg delim "$delimiter" '.tokens.authenticator_tokens
    |= map(.original_name = if .original_name == "" then .name else .original_name end) | .tokens.authenticator_tokens[] | "\(.original_name)\($delim)\(.name) -- \(.original_name)"' -r)
item=$(echo "$pairs" | fzf --delimiter $delimiter --with-nth 2)

if [[ ! -n "$item" ]]; then
    echo "No item selected"
    exit 1
fi

name=$(echo "$item" | sed "s/$delimiter.*//" | sed 's/ /%20/g')

echo "Load authy TOTP credentials from $file"
out=$(authy-export -load $file)
if [[ $1 = "--raw" ]]; then
    read -p "(WARNING) You choose the \"--raw\" option. Are you sure you want to display your secret keys? (y/n): " confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        echo $out | tr " " "\n"
    else
        echo "canceled."
    fi
    exit 0
fi

s=$(echo $out | tr " " "\n" | grep -i $name)

re="[[:space:]]+"
if [[ $s =~ $re ]]; then
    echo "ambiguous selection. Please specify the name of the TOTP credential to use"
    read -p "This will show your secrets as clear text. Are you sure you want to continue? (y/n): " confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        s=$(echo $s | tr " " "\n" | fzf)
    else
        echo "canceled."
        exit 1
    fi
fi

secret=$(echo $s | sed 's/.*=//')
if [[ ! -n "$secret" ]]; then
    echo "No item selected"
    exit 1
fi


KEY=$secret

# Decode the Base32 encoded key
KEY_BIN=$(echo "$KEY" | base32 --decode | xxd -p -c 64 | tr -d '\n')

# Get the current Unix time and adjust by the time step (default is 30 seconds)
T=$(($(date +%s) / 30))

# Convert the timestamp to an 8-byte, big-endian binary string
TIME=$(printf "%016x" $T | xxd -r -p | xxd -p -c 64 | tr -d '\n')

# Generate HMAC-SHA1 hash
HASH=$(echo -n $TIME | xxd -r -p | openssl dgst -binary -sha1 -mac HMAC -macopt hexkey:$KEY_BIN | xxd -p -c 64 | tr -d '\n')

# Extract the dynamic binary code (last 4 bits determine the offset)
OFFSET=$(echo $HASH | xxd -r -p | tail -c 1 | od -An -t u1)
OFFSET=$(($OFFSET & 0xF))

# Extract the OTP from the specified offset, use 4 bytes
OTP=$(echo $HASH | xxd -r -p | dd bs=1 skip=$OFFSET count=4 2>/dev/null | xxd -p -c 8 | tr -d '\n')

# Convert to decimal, extract last 6 digits
TOTP=$(echo $((0x$OTP & 0x7FFFFFFF)))

# Output only the last 6 characters (digits of the TOTP)
TOTP=${TOTP: -6}

echo $TOTP | utf8clip.exe
echo "copied totp to clipboard"
exit 0
