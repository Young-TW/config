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
    for dir in ./*/
        if test -d $dir.git
            echo ">>> Updating repo: $dir"
            pushd $dir > /dev/null
            git pull
            popd > /dev/null
        end
    end
end
