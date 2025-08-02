#!/usr/bin/env bash

# Hämta workspace från Hyprland
ws=$(hyprctl activeworkspace | grep workspace | awk '{print $2}')

# Sätt variabeln i eww
eww update current_workspace=$ws

# Visa fönstret
eww open workspace_osd

# Vänta 1 sekund och stäng
sleep 1
eww close workspace_osd
