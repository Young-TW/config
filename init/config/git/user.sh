#!/usr/bin/env bash

# check if git is installed

if ! command -v git &>/dev/null; then
	echo "git could not be found"
	exit
fi

# git setting

git config --global user.name "young"
git config --global user.email "young20050727@gmail.com"
