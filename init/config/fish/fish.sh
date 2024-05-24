#!/bin/bash

# check package manager

if [ -x "$(command -v apt)" ]; then
    apt update
    apt install -y fish
elif [ -x "$(command -v dnf)" ]; then
    dnf install -y fish
elif [ -x "$(command -v pacman)" ]; then
    paru -Syu --noconfirm fish
elif [ -x "$(command -v brew)" ]; then
    brew install fish
else
    echo "No package manager found"
    exit 1
fi

# install fisher and plugins

fish ../fish/fisher.fish