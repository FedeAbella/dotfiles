#!/bin/bash

location="Montevideo+Uruguay"

for i in {1..5}; do
    if weather="$(curl -s https://wttr.in/$location?format=%c+%t+%p+%w)"; then
        jq -c -M --arg weather "$weather" '.icon = ($weather | split(" ") | .[0]) | .temp = "🌡️" + ($weather | split(" ") | .[2]) | .prec = "☔" + ($weather | split(" ") | .[3]) | .wind = "🍃" + ($weather | split(" ") | .[4]) | .text = .icon + " " + .temp + " " + .prec + " " + .wind | {text}' < <(echo '{}')
        exit
    fi
    sleep 2
done

echo '{"text": ""}'
