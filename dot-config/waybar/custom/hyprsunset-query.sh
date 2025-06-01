#!/bin/bash

current_temp="6000"

if [[ -d ${HOME}/.config/hyprsunset ]] && [[ -f ${HOME}/.config/hyprsunset/temp ]]; then
    current_temp=$(cat "${HOME}"/.config/hyprsunset/temp)
fi

if [[ "${current_temp}" == "6000" ]]; then
    echo '{"alt": "disabled", "class": "disabled"}'
else
    echo '{"alt": "enabled", "class": "enabled"}'
fi
