#!/usr/bin/env fish

# depend on init/config/fish/function.fish

# load functions
source ~/.config/fish/function.fish

install_package openjdk-21-jre-headless

change_dir ~/Minecraft
mkdir -p spigot
change_dir spigot
change_dir ~
