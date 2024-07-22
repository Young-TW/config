#!/usr/bin/env bash

clang++ "$@" -o temp -std=c++20
./temp
rm temp
