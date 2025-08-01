#!/bin/bash

# Enable strict error handling
set -euo pipefail

LOGFILE="$HOME/.cache/hyprpaper-random.log"
echo "=== Starting random wallpaper script at $(date) ===" >> "$LOGFILE"

# Get connected monitor names into array
MONITORS=($(hyprctl monitors -j | jq -r '.[] | .name'))

if [[ ${#MONITORS[@]} -lt 2 ]]; then
    echo "ERROR: Less than 2 monitors detected. Found: ${#MONITORS[@]}" >> "$LOGFILE"
    exit 1
fi

echo "Detected monitors: ${MONITORS[*]}" >> "$LOGFILE"

# Select random wallpaper files
MAIN_WP=$(find "$HOME/Pictures/Wallpapers/Main" -type f | shuf -n1)
SECONDARY_WP=$(find "$HOME/Pictures/Wallpapers/Secondary" -type f | shuf -n1)

echo "Selected MAIN wallpaper: $MAIN_WP" >> "$LOGFILE"
echo "Selected SECONDARY wallpaper: $SECONDARY_WP" >> "$LOGFILE"

# Set wallpapers with hyprctl hyprpaper (monitor,file)
hyprctl hyprpaper wallpaper "${MONITORS[0]},${MAIN_WP}" >> "$LOGFILE" 2>&1
hyprctl hyprpaper wallpaper "${MONITORS[1]},${SECONDARY_WP}" >> "$LOGFILE" 2>&1

echo "Wallpapers set successfully." >> "$LOGFILE"
