#!/usr/bin/env bash

# check git installation

if [ -x "$(command -v git)" ]; then
    echo "Git is already installed"
else
    echo "Git is not installed"
    exit 1
fi

cd ~/Software || exit
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si
