#!/bin/bash

workspace=$(hyprctl activeworkspace | head -n 1 | grep -o -P '(?<=workspace ID )\d+')

if [ "$workspace" = "5" ] || [ "$workspace" = "10" ]; then
    hyprctl dispatch workspace m~1
    exit 0
fi

hyprctl dispatch workspace r+1
