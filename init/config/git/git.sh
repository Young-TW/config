#!/usr/bin/env bash

# check package manager

if [ -x "$(command -v apt)" ]; then
    apt update
    apt install -y git
elif [ -x "$(command -v dnf)" ]; then
    dnf install -y git
elif [ -x "$(command -v pacman)" ]; then
    paru -Syu --noconfirm git
elif [ -x "$(command -v brew)" ]; then
    brew install git
else
    echo "No package manager found"
    exit 1
fi

# git setting

bash ./config/git/user.sh