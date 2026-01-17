#!/usr/bin/env bash
# ~/.config/hypr/toggle-kitty-dropdown.sh

if hyprctl clients | grep -qE 'class: dropdown'; then
  hyprctl dispatch closewindow class:dropdown
else
  hyprctl dispatch exec "[float; size 1000 600; move 24% 22%] kitty --class dropdown"
fi

