#!/usr/bin/env fish
# Iterate direct subdirectories; if it's a git repo, add/update "codeberg" remote and push all branches & tags.

set -l codeberg_host codeberg      # assumes SSH config like: Host codeberg
set -l codeberg_user Young         # your Codeberg username

# Ensure git exists
type -q git; or begin
    echo "git not found"; exit 1
end

# One-level deep directories
set -l dirs (command find . -mindepth 1 -maxdepth 1 -type d -print)

for dir in $dirs
    # Normalize directory name
    set -l repo (basename $dir)

    # Skip non-git directories
    if not test -d "$dir/.git"
        continue
    end

    echo ""
    echo "==> Processing $repo"
    pushd $dir >/dev/null

    set -l url "$codeberg_host:$codeberg_user/$repo"

    # Ensure we are in a work tree
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        # Add or update "codeberg" remote
        if git remote get-url codeberg >/dev/null 2>&1
            set -l current (git remote get-url codeberg 2>/dev/null)
            if test "$current" != "$url"
                echo "Updating remote URL: $current -> $url"
                git remote set-url codeberg $url
            else
                echo "Remote 'codeberg' already set to $url"
            end
        else
            echo "Adding remote 'codeberg' -> $url"
            git remote add codeberg $url
        end

        # Push all branches and tags
        echo "Pushing branches..."
        if not git push --all codeberg
            echo "Warn: failed to push branches for $repo"
        end

        echo "Pushing tags..."
        if not git push --tags codeberg
            echo "Warn: failed to push tags for $repo"
        end
    else
        echo "Skipped: not a git work tree."
    end

    popd >/dev/null
end

echo ""
echo "Done."
