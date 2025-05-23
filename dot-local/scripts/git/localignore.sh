#!/bin/bash

GIT_ROOT=$(git rev-parse --show-toplevel 2>&1)
[ -d "$GIT_ROOT" ] || { echo "Not a git repository" && exit 1; }

ln -sf "$GIT_ROOT"/.git/info/exclude "$GIT_ROOT"/.gitignore-local
echo ".gitignore-local" >"$GIT_ROOT"/.gitignore-local
