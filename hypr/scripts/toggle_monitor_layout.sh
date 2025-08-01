#!/bin/bash

# Toggle file to store state
STATE_FILE="/tmp/hypr_monitor_layout_state"

# Monitor descriptors (you can get exact names with `hyprctl monitors`)
MON1="desc:AOC AG271QG4 0x0000005E"
MON2="desc:Samsung Electric Company Odyssey G70B H1AK500000"

# Connected layout positions
POS1="0x0"
POS2="2560x0"

# Isolated layout: move second monitor far away
POS2_ISOLATED="10000x0"

# Check current state
if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "connected" ]]; then
  echo "Switching to ISOLATED layout..."
  hyprctl keyword monitor "$MON1,2560x1440@144,$POS1,1,vrr,2"
  hyprctl keyword monitor "$MON2,3840x2160@144,$POS2_ISOLATED,1"
  echo "isolated" > "$STATE_FILE"
else
  echo "Switching to CONNECTED layout..."
  hyprctl keyword monitor "$MON1,2560x1440@144,$POS1,1,vrr,2"
  hyprctl keyword monitor "$MON2,3840x2160@144,$POS2,1"
  echo "connected" > "$STATE_FILE"
fi
