#!/usr/bin/env bash

# check cargo installation
if ! command -v cargo &> /dev/null; then
    echo "Cargo is not installed. Please install Rust and Cargo first."
    exit 1
fi

cargo install yu-pkg
