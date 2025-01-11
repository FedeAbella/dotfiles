#!/usr/bin/env sh

filename=$(hyprshot --mode region --freeze -- echo)
satty --filename "$filename" --output-filename "$(dirname "$filename")/$(basename "$filename" .png)"_annotated.png
