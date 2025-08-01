#!/bin/bash

# Start hyprpaper if not already running
pgrep -x hyprpaper >/dev/null || hyprpaper &

sleep 1  # Give hyprpaper time to initialize IPC

# Get monitor names
readarray -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

# Define your folders
MAIN_DIR="$HOME/Pictures/Wallpapers/Main"
SECONDARY_DIR="$HOME/Pictures/Wallpapers/Secondary"

# Select random wallpapers
MAIN_WP=$(find "$MAIN_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)
SECONDARY_WP=$(find "$SECONDARY_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Fallback if any image is missing
[ -z "$MAIN_WP" ] && echo "No image in $MAIN_DIR" && exit 1
[ -z "$SECONDARY_WP" ] && echo "No image in $SECONDARY_DIR" && exit 1

# Assign wallpapers
if [ "${#MONITORS[@]}" -ge 1 ]; then
  hyprctl hyprpaper preload "$MAIN_WP"
  hyprctl hyprpaper wallpaper "${MONITORS[0]},fill:$MAIN_WP"
fi

if [ "${#MONITORS[@]}" -ge 2 ]; then
  hyprctl hyprpaper preload "$SECONDARY_WP"
  hyprctl hyprpaper wallpaper "${MONITORS[1]},fill:$SECONDARY_WP"
fi
