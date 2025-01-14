#!/bin/bash

user=$(whoami)

case $user in
    fede)
        hyprctl dispatch exec "[workspace 6 silent] flatpak run com.rtosta.zapzap"
        hyprctl dispatch exec "[workspace 6 silent] discord"
        /usr/bin/steam-runtime -silent &
        sleep 3
        hyprctl dispatch exec "[workspace 1] firefox"
        ;;
    attentis)
        hyprctl dispatch exec "[workspace 6 silent] teams-for-linux"
        hyprctl dispatch exec "[workspace 3 silent] chromium --profile-directory='Profile 1'"
        hyprctl dispatch exec "[workspace 2 silent] kitty"
        hyprctl dispatch exec "[workspace 10 silent] firefox"
        hyprctl dispatch exec "[workspace 6 silent] flatpak run com.rtosta.zapzap"
        sleep 3
        hyprctl dispatch exec "[workspace 1] chromium --profile-directory=Default"
        ;;
    *) ;;
esac
