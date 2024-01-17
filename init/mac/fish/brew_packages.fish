#!/usr/bin/fish

# install homebrew packages

for i in "btop" "clang" "cmake" "cmatrix" "cmus" "fish" "gh" "git" "java" "neofetch" "onefetch" "python3" "ranger" "tmux" "youtube-dl"
  eval "brew install $i"
end

# install brew cask packages

for i in "anki" "anydesk" "code" "discord" "docker" "element" "firefox" "iterm2" "kitty"
  eval "brew install $i"
end