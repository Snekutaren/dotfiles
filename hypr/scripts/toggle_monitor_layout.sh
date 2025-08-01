#!/bin/bash

# Monitor names
MON_LEFT="DP-2"   # AOC AG271QG4
MON_RIGHT="DP-1"  # Samsung Odyssey G70B

# Positions
POS_LEFT="0x0"
POS_RIGHT_CONNECTED="2560x0"
POS_RIGHT_ISOLATED="10000x0"

# Modes
RES_LEFT="2560x1440@144"
RES_RIGHT="3840x2160@144"

# Get current X position of right monitor (DP-1)
POS_RIGHT_CURRENT_X=$(hyprctl monitors -j | jq -r '.[] | select(.name=="'"$MON_RIGHT"'") | .x')

if [[ "$POS_RIGHT_CURRENT_X" == "2560" ]]; then
  echo "→ Switching to ISOLATED layout..."
  hyprctl keyword monitor "$MON_LEFT,$RES_LEFT,$POS_LEFT,1,vrr,2"
  hyprctl keyword monitor "$MON_RIGHT,$RES_RIGHT,$POS_RIGHT_ISOLATED,1"
else
  echo "→ Switching to CONNECTED layout..."
  hyprctl keyword monitor "$MON_LEFT,$RES_LEFT,$POS_LEFT,1,vrr,2"
  hyprctl keyword monitor "$MON_RIGHT,$RES_RIGHT,$POS_RIGHT_CONNECTED,1"
fi
