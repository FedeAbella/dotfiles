#!/bin/bash

workspace=$(hyprctl activeworkspace | head -n 1 | grep -o -P '(?<=workspace ID )\d+')

if [ "$workspace" == "1" ] || [ "$workspace" == "6" ]; then
    hyprctl dispatch movetoworkspace m~5
    exit 0
fi

hyprctl dispatch movetoworkspace r-1
