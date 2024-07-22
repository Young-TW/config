#!/usr/bin/env fish

# check argument is cpp, rust, sh, bash, or fish

if test (count $argv) -eq 0
    echo "Usage: format.sh <cpp|rust|sh|bash|fish>"
    exit 1
end

set format_type $argv[1]

switch $format_type
    case "cpp"
        for ext in cpp hpp c h cc cxx hxx
            find . -name "*.$ext" -exec clang-format -i {} \;
        end
    case "rust"
        find . -name '*.rs' | while read -l file
            rustfmt "$file"
        end
    case "sh" "bash"
        find . -name '*.sh' | while read -l file
            shfmt -w "$file"
        end
    case "fish"
        find . -name '*.fish' | while read -l file
            fish_indent -w "$file"
        end
    case '*'
        echo "Usage: format.sh <cpp|rust|sh|bash|fish>"
        exit 1
end
