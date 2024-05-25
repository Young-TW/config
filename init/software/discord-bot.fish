#!/usr/bin/env fish

# depend on init/config/fish/function.fish

# load functions
source ~/.config/fish/function.fish

change_dir ~
if not git clone https://github.com/Young-TW/Discord-Bot.git
    echo "Failed to clone Discord-Bot repository"
    exit 1
end
change_dir Discord-Bot/discordpy
# python3 ubuntuserverbot.py
change_dir ~
