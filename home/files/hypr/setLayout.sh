#!/usr/bin/env bash

# Get current workspace
workspace=$(hyprctl activeworkspace -j | jq -r '.id')

function dashboard()
{
   hyprctl dispatch workspace $workspace
   sleep 0.2
   
   kitty --title "${workspace}_FETCH_TERM" -e bash -i -c "fetch; exec bash" &
   sleep 0.3
   
   hyprctl dispatch split:down
   kitty --title DWIGHT_TERM -e bash -i -c "dwight; exec bash" &
   sleep 0.3
   
   hyprctl dispatch focuswindow "title:^(${workspace}_FETCH_TERM)$"
   sleep 0.2
   
   hyprctl dispatch movewindow l
   hyprctl dispatch split:left
   kitty --title BTOP_TERM -e btop &
   sleep 0.5
}

function clearWorkspace()
{
   clients=$(hyprctl clients -j | jq -r \
      ".[] | select(.workspace.id == $workspace) | .address")

   for addr in $clients; do
       hyprctl dispatch killwindow address:$addr
   done
}

# If setting terminal dashboard on current workspace
if [[ $1 == -d ]]
then
   # Reset current workspace to dashboard
   clearWorkspace
   dashboard $workspace

# If clearing current workspace
elif [[ $1 == -c ]]
then
   # Clear workspace
   clearWorkspace $workspace

# If initializing first two workspaces
elif [[ $1 == -i ]]
then
   # Workspace 1 setup
   dashboard 1
   
   # Workspace 2 setup
   hyprctl dispatch workspace 2
   brave
fi

