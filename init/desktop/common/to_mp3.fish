#!/usr/bin/env fish

for file in *
    if not test (string match -r ".*\.mp3$" "$file")
        set filename (string replace -r "\.[^\.]*$" "" "$file")
        ffmpeg -i "$file" "$filename.mp3"
        rm "$file"
    end
end
