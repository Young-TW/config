#!/usr/bin/env fish

# depend on init/config/fish/function.fish

# load functions
source ~/.config/fish/function.fish

change_dir ~/Mindustry
if not wget https://github.com/Anuken/Mindustry/releases/download/v146/server-release.jar
    echo "Failed to download Mindustry server"
    exit 1
end
# java -jar server-release.jar
change_dir ~
