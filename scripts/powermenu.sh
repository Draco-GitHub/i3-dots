#!/upwdsr/bin/env bash

# Power menu options
options="  Shutdown\n  Reboot\n  Suspend\n  Logout\n  Lock"

chosen=$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi -p>

case "$chosen" in
    *Shutdown*)
        systemctl poweroff
        ;;
    *Reboot*)
        systemctl reboot
        ;;
    *Suspend*)
        systemctl suspend
        ;;
    *Logout*)
        i3-msg exit
        ;;
    *Lock*)
        i3lock
        ;;
esac
