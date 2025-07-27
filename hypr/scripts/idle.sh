#!/usr/bin/env bash

# Wait a short time to ensure Hyprland is fully started
sleep 2

# Start swayidle with desired settings
exec swayidle -w \
  timeout 5 'hyprlock' \
  timeout 600 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep 'hyprlock'

echo "[Hyprlock] swayidle started at $(date)" >> ~/hypridle.log

