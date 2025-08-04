#!/usr/bin/env bash

set -e

cp -r -f . /etc/nixos/
nixos-rebuild switch || {
    echo "Failed to apply NixOS configuration"
    exit 1
}

# delete the old configuration generation
nixos-collect-garbage -d

echo "NixOS configuration applied successfully"
