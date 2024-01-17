#!/bin/bash

cd ~ || exit
mkdir Code Desktop Document Music Picture Software Video

# install git

pacman -S git

# git setting

git config --global user.name "young"
git config --global user.email young20050727@gmail.com

# install paru

cd ~/Software || exit
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si

# install packages from paru

paru -S anydesk btop cider clang cmake cmatrix cmus discord fish fisher github-cli extra/jre17-openjdk-headless neofetch python3 ranger tmux youtube-dl

# fish setting

fish ./fish/fisher.fish

# install cmake-init

bash ./software/cmake-init.sh
