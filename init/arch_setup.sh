#!/bin/bash

cd ~ || exit
mkdir Code Desktop Document Music Picture Software Video

# install git

pacman -Syu --nocofirm git

bash ./config/git/user.sh

# install paru



# fish setting

fish ./fish/fisher.fish

# install cmake-init

bash ./software/cmake-init.sh
