#!/usr/bin/env fish

function change_dir
    cd $argv || begin
        echo "Failed to change directory to $argv"
        exit 1
    end
end

function install_package
    if test command -v apt
        set package_manager apt
        apt update
        apt install -y $argv
    else if command -v dnf
        set package_manager dnf
        dnf install -y $argv
    else if command -v paru
        set package_manager paru
        paru -Syu --noconfirm $argv
    else if command -v brew
        set package_manager brew
        brew install $argv
    else
        echo "Unsupported package manager"
        exit 1
    end
end

function git-pull-all
    set -l depth 1

    if set -l idx (contains -i -- -L $argv)
        set -l next (math $idx + 1)
        if test $next -le (count $argv)
            set depth $argv[$next]
        end
    end

    _git_pull_all_r (pwd) $depth
end

function _git_pull_all_r
    set -l dir $argv[1]
    set -l remaining $argv[2]

    for subdir in $dir/*/
        test -d $subdir; or continue
        if test -d $subdir.git
            echo ">>> Updating repo: $subdir"
            pushd $subdir > /dev/null
            git pull
            popd > /dev/null
        else if test $remaining -gt 1
            _git_pull_all_r $subdir (math $remaining - 1)
        end
    end
end

function deploy-nixos
    # usage: deploy-nixos ~/code/nix-flake
    set -l src (realpath $argv[1])
    if test -z "$src"
        echo "usage: deploy-nixos <repo-path>"
        return 1
    end
    if not test -d $src
        echo "not a directory: $src"
        return 1
    end

    sudo cp -a /etc/nixos /etc/nixos.bak.(date +%F-%H%M)
    sudo rsync -a --delete --exclude '.git' $src/ /etc/nixos/
    if not test -f /etc/nixos/hardware-configuration.nix
        echo "hardware-configuration.nix not found; generating..."
        sudo nixos-generate-config
    end
    sudo nixos-rebuild switch --show-trace
end
