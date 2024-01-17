#!/bin/bash

# install cmake-init

cd ~/Software || exit
git clone https://github.com/Young-TW/cmake-init.git
cd cmake-init || exit
cmake . -B build
cmake --build build --config RELEASE
cmake --install build
cd ~ || exit
