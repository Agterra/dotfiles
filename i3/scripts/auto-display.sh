#!/usr/bin/bash
# Little script for auto-display

xrandr --output DP-1 --auto \
  --output DP-2 --auto \
  --output DP-3 --auto \
  --output DP-4 --auto \
  --output eDP-1 --auto

if [ -z "$(grep closed -a /proc/acpi/button/lid/LID0/state)" ];
then
  xrandr --output DP-1 --auto --above eDP-1 \
    --output DP-2 --auto --above eDP-1 \
    --output DP-3 --auto --above eDP-1 \
    --output DP-4 --auto --above eDP-1
else
  xrandr --output DP-1 --auto --output eDP-1 --off \
    --output DP-2 --auto --output eDP-1 --off\
    --output DP-3 --auto --output eDP-1 --off\
    --output DP-4 --auto --output eDP-1 --off
fi
