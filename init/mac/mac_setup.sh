#!/bin/bash

cd ~ || exit
mkdir Software

# install homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew packages

fish ./fish/brew_packages.fish

# git setting

git config --global user.name "young"
git config --global user.email young20050727@gmail.com

# fish setting

fish ./fish/fisher.fish

# install cmake-init

bash ./software/cmake-init.sh
