#!/bin/bash

languages=("us" "es")
options=$(printf "%s\n" "${languages[@]}")

selected_language=$(echo -e "$options" | rofi -dmenu -p)

setxkbmap $selected_language

notify-send "$selected_language"
