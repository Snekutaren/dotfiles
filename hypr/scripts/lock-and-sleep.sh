#!/bin/bash
   pidof hyprlock || hyprlock &
   sleep 60
   if pidof hyprlock; then
       hyprctl dispatch dpms off
   fi