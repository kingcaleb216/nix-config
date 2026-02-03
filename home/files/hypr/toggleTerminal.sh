#!/usr/bin/env bash

# If floating terminal already exists
if hyprctl clients | grep -qE 'class: dropdown'; then
  hyprctl dispatch closewindow class:dropdown

# Initialize a new one
else
  hyprctl dispatch exec "[float; size 1000 600; move 24% 22%] kitty --class dropdown"
fi

