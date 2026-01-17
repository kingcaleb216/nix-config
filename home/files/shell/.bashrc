#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s expand_aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\e[0;34m󱄅  \u \W >\e[0m '

# Specialisation aliases
source ~/.config/specialisation_aliases.sh

# ---------------------------------------------------------------
# User Aliases
# ---------------------------------------------------------------

# Standard
alias ll="ls -la"
alias bashrc="vim ~/nix-config/home/files/shell/.bashrc && source ~/.bashrc"
alias vimrc="vim ~/nix-config/home/files/shell/.vimrc"
alias repo="cd ~/nix-config"
alias fetch="clear && fastfetch"

# Config
alias ch="vim ~/nix-config/home/files/hypr/hyprland.conf"
alias cw="vim ~/nix-config/home/files/waybar/config.jsonc"
alias cws="vim ~/nix-config/home/files/waybar/style.css"

# Ascii Aliases
alias dwight="~/.config/asciiArt/asciiArt.sh dwight"
alias catbox="~/.config/asciiArt/asciiArt.sh catBox"
alias deer="~/.config/asciiArt/asciiArt.sh deer"
alias squirrel="~/.config/asciiArt/asciiArt.sh deer"
alias ridgecrest="~/.config/asciiArt/asciiArt.sh ridgecrest"
alias arch="~/.config/asciiArt/asciiArt.sh arch"
alias ascii="~/.config/asciiArt/asciiArt.sh"

# ---------------------------------------------------------------
# User functions
# ---------------------------------------------------------------

function cd()
{
   builtin cd $1
   ll
}

