#!/bin/bash

user=$(whoami)

case $user in
    fede)
        hyprctl dispatch exec "[workspace 7 silent] flatpak run com.rtosta.zapzap"
        hyprctl dispatch exec "[workspace 7 silent] discord"
        /usr/bin/steam-runtime -silent &
        sleep 3
        hyprctl dispatch exec "[workspace 1] firefox"
        ;;
    attentis)
        hyprctl dispatch exec "[workspace 7 silent] teams-for-linux"
        hyprctl dispatch exec "[workspace 4 silent] brave --profile-directory='Profile 2' --password-store=detect"
        hyprctl dispatch exec "[workspace 2 silent] kitty"
        hyprctl dispatch exec "[workspace 9 silent] firefox"
        hyprctl dispatch exec "[workspace 7 silent] flatpak run com.rtosta.zapzap"
        sleep 3
        hyprctl dispatch exec "[workspace 1] brave --profile-directory='Profile 1' --password-store=detect"
        ;;
    *) ;;
esac
