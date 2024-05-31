#!/usr/bin/env fish

find . -maxdepth 1 -type f ! -name "*.mp3" | while read -l file
    set filename (basename "$file" | string replace -r '\.[^\.]*$' '')
    ffmpeg -i "$file" "$filename.mp3"
    rm "$file"
end
