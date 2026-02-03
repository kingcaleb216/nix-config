#!/usr/bin/env bash

set -euo pipefail

# Get if current window is floating
floating="$(hyprctl activewindow -j | jq -r '.floating')"

# If not floating
if [[ "$floating" == "false" ]]; then
  # Enter floating
  hyprctl dispatch togglefloating

  # Give Hyprland a moment to flip the state before centering/resizing
  sleep 0.05

  # Now these apply to a floating window
  hyprctl dispatch resizeactive exact 1200 800
  hyprctl dispatch centerwindow
else
  # Exit floating back to tiling
  hyprctl dispatch togglefloating
fi

