#!/bin/bash

if [[ -z $1 ]]; then
    echo "Must specify branch to switch to" >&2
    exit 1
fi

git switch "$1" && git pull
