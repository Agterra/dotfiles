#!/usr/bin/bash
if grep -q open /proc/acpi/button/lid/LID0/state; then
    swaymsg output eDP-1 enable
    swaymsg output eDP-1 scale 1
else
    swaymsg output eDP-1 disable
fi
