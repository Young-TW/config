#!/bin/bash

cd ~ || exit
mkdir Code Desktop Document Music Picture Software Video

# install git

pacman -Syu --nocofirm git

bash ./config/git/user.sh

# install paru

bash ./config/paru/paru.sh

# fish setting

fish

# install cmake-init

bash ./software/cmake-init.sh
