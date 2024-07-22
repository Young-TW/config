#!/usr/bin/env bash

if ! command -v curl &> /dev/null
then
    echo "curl could not be found"
    exit 1
fi

if [ -z "$1" ]; then
    echo "No URL provided"
    exit 1
fi

SCRIPT_URL="$1"
SCRIPT_NAME=$(basename "$SCRIPT_URL")

curl -sSL "$SCRIPT_URL" -o "/usr/local/bin/$SCRIPT_NAME"
if [ $? -ne 0 ]; then
    echo "Failed to download script"
    exit 1
fi

chmod +x "/usr/local/bin/$SCRIPT_NAME"

echo "Script installed as /usr/local/bin/$SCRIPT_NAME"
