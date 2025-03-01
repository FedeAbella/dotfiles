#!/bin/bash

workspace=$(hyprctl activeworkspace | head -n 1 | grep -o -P '(?<=workspace ID )\d+')

if [ "$workspace" == "1" ] || [ "$workspace" == "4" ] || [ "$workspace" == "7" ]; then
    hyprctl dispatch workspace m~3
    exit 0
fi

hyprctl dispatch workspace r-1
