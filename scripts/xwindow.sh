#!/usr/bin/env bash

active_window=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')

# If no active window
if [[ -z "$active_window" || "$active_window" == "0x0" ]]; then
    echo ""
    exit 0
fi

wm_class=$(xprop -id "$active_window" WM_CLASS 2>/dev/null)
title=$(xprop -id "$active_window" WM_NAME 2>/dev/null | cut -d '"' -f2)

instance=$(echo "$wm_class" | cut -d '"' -f2)
class=$(echo "$wm_class" | cut -d '"' -f4)

if [[ "${instance,,}" == "alacritty" ]]; then
    echo " $title"

elif [[ "${class,,}" == "librewolf" ]]; then
    echo "󰈹 $title"

elif [[ "${class,,}" == "discord" ]]; then
    echo "  $title"

else
    echo "$title"
fi
