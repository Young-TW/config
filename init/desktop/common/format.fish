#!/usr/bin/env fish

# check argument is cpp or sh

if test (count $argv) -eq 0
    echo "Usage: format.sh <cpp|sh>"
    exit 1
end

if test $argv[1] = "cpp"
    find . -name '*.cpp' -exec clang-format -i {} \;
else if test $argv[1] = "sh"
    find . -name '*.sh' | while read -l file; shfmt -w "$file"; end
else
    echo "Usage: format.sh <cpp|sh>"
    exit 1
end
