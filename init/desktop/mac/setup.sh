#!/usr/bin/env bash

cd ~ || exit
mkdir Software

# install homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew packages

fish ./fish/brew_packages.fish

# fish setting

fish ./fish/fisher.fish

# install cmake-init

bash ./software/cmake-init.sh
