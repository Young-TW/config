#!/usr/bin/env bash

# install cmake-init

cd ~/Software || exit
git clone https://github.com/Young-TW/yush.git --recursive
cd yush || exit
cmake . -B build
cmake --build build --config RELEASE
cmake --install build
cd ~ || exit
