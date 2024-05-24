#!/usr/bin/env fish

# install homebrew packages

for i in "btop" "clang" "cmake" "cmatrix" "cmus" "docker" "fish" "gh" "git" "java" "neofetch" "onefetch" "python3" "ranger" "tmux" "youtube-dl"
  eval "brew install $i"
end

# install brew cask packages

for i in "anydesk" "bitwarden" "brave-browser" "discord" "element" "iterm2" "kitty"
  eval "brew install $i"
end