#!/bin/bash

capslock=$(cat /sys/class/leds/input10::capslock/brightness)

if [[ "${capslock}" == "1" ]]; then
    echo '{"text": "locked", "alt": "locked", "class": "locked"}'
    exit 0
fi

echo '{"text": "unlocked", "alt": "unlocked", "class": "unlocked"}'
