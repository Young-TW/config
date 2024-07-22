#!/usr/bin/env bash

# check git is installed

if [ -x "$(command -v git)" ]; then
	cd ~ || exit 1
	# Install dotfiles
	git clone https://github.com/Young-TW/dotfiles.git
	mv dotfiles/home/.config ~/.config
else
	echo "Git is not installed"
	exit 1
fi
