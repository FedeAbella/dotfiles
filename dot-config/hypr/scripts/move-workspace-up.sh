#!/bin/bash

workspace=$(hyprctl activeworkspace | head -n 1 | grep -o -P '(?<=workspace ID )\d+')

if [ "$workspace" = "3" ] || [ "$workspace" = "6" ] || [ "$workspace" = "9" ]; then
    hyprctl dispatch movetoworkspace m~1
    exit 0
fi

hyprctl dispatch movetoworkspace r+1
