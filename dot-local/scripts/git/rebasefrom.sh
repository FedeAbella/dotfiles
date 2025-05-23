#!/bin/bash

remote=origin

if [[ -z $1 ]]; then
    echo "Must specify branch to rebase from" >&2
    exit 1
fi

if [[ -n $2 ]]; then
    remote=$2
fi

git pull "$remote" "$1:$1" && git rebase "$1"
