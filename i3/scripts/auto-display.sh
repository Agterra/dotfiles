#!/usr/bin/bash
# Little script for auto-display

# Check the lid status of laptop
IS_CLOSED=$(grep closed -a /proc/acpi/button/lid/LID0/state)

# Retrieve all connected screens
SCREENS=$(xrandr | grep \ connected | awk '{print substr($0, 0, 5)}')

# Building xrandr command
COMMAND="xrandr"

# Defining primary display, would be the laptop
MAIN=$(xrandr | grep primary | awk '{print substr($0, 0, 5)}')

# Building displays, depending on the laptop lid state
for i in $SCREENS; do
  if [ $i == $MAIN ]; then
    if [ -z "$IS_CLOSED" ]; then
      COMMAND+=" --output $MAIN --auto"
    else
      COMMAND+=" --output $MAIN --off"
    fi
  else
    COMMAND+=" --output $i --auto --above $MAIN"
  fi
done

$COMMAND

