#!/bin/bash

# Monitor descriptors (adjust as needed — use `hyprctl monitors` to confirm names)
MON1="desc:AOC AG271QG4 0x0000005E"
MON2="desc:Samsung Electric Company Odyssey G70B H1AK500000"

# Expected connected positions
POS1_CONNECTED="0x0"
POS2_CONNECTED="2560x0"

# Isolated mode: second monitor moved far right
POS2_ISOLATED="10000x0"

# Get current monitor positions using hyprctl
POS2_CURRENT=$(hyprctl monitors -j | jq -r '.[] | select(.name == "'"$MON2"'") | "\(.x)x\(.y)"')

if [[ "$POS2_CURRENT" == "$POS2_CONNECTED" ]]; then
  echo "→ Switching to ISOLATED layout..."
  hyprctl keyword monitor "$MON1,2560x1440@144,$POS1_CONNECTED,1,vrr,2"
  hyprctl keyword monitor "$MON2,3840x2160@144,$POS2_ISOLATED,1"
else
  echo "→ Switching to CONNECTED layout..."
  hyprctl keyword monitor "$MON1,2560x1440@144,$POS1_CONNECTED,1,vrr,2"
  hyprctl keyword monitor "$MON2,3840x2160@144,$POS2_CONNECTED,1"
fi
