#!/bin/bash

# Start hyprpaper if not already running
pgrep -x hyprpaper >/dev/null || hyprpaper &

sleep 1  # Give hyprpaper time to initialize IPC

# Get monitor names (using jq to parse JSON output)
readarray -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

MAIN_DIR="$HOME/Pictures/Wallpapers/Main"
SECONDARY_DIR="$HOME/Pictures/Wallpapers/Secondary"

# Select random wallpapers (only jpg/png/jpeg)
MAIN_WP=$(find "$MAIN_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)
SECONDARY_WP=$(find "$SECONDARY_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Check if wallpapers exist
if [ -z "$MAIN_WP" ]; then
  echo "No wallpapers found in $MAIN_DIR"
  exit 1
fi

if [ -z "$SECONDARY_WP" ]; then
  echo "No wallpapers found in $SECONDARY_DIR"
  exit 1
fi

# Preload wallpapers (paths only, no prefixes)
hyprctl hyprpaper preload "$MAIN_WP"
hyprctl hyprpaper preload "$SECONDARY_WP"

# Assign wallpapers with 'fill:' prefix BEFORE the colon separating mode and path
# Format: wallpaper "Monitor,mode:/full/path/to/image"
if [ "${#MONITORS[@]}" -ge 1 ]; then
  hyprctl hyprpaper wallpaper "${MONITORS[0]},fill:$MAIN_WP"
fi

if [ "${#MONITORS[@]}" -ge 2 ]; then
  hyprctl hyprpaper wallpaper "${MONITORS[1]},fill:$SECONDARY_WP"
fi
