#!/usr/bin/env bash

active_window=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')
wm_class=$(xprop -id "$active_window" WM_CLASS)

instance=$(echo "$wm_class" | cut -d '"' -f2)
class=$(echo "$wm_class" | cut -d '"' -f4)

title=$(xprop -id "$active_window" WM_NAME | cut -d '"' -f2)

if [[ "${instance,,}" == "ghostty" ]]; then
    echo " $title"

elif [[ "${class,,}" == "librewolf" ]]; then
    echo "󰈹 $title"

else
    echo "$title"
fi
