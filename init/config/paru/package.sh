#!/usr/bin/env bash

# check paru installation

if [ -x "$(command -v paru)" ]; then
    echo "paru is already installed"
else
    echo "paru is not installed"
    exit 1
fi

paru -S anydesk btop cider clang cmake cmatrix cmus discord fish fisher github-cli extra/jre17-openjdk-headless neofetch python3 ranger tmux youtube-dl