#!/usr/bin/env fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
for I in "jorgebucaran/fisher" "simnalamburt/shellder" "jethrokuan/z" "IlanCosman/tide@v6"
      fisher install $I
end