{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";

      ll = "ls -la";
      bashrc = "vim ~/.bashrc && source ~/.bashrc";
      vimrc = "vim ~/.vimrc";
      repo = "cd /opt/repos";
      rh = "cd /opt/repos/hyprland";

      # You asked for these globally (not Hyprland-only)
      fetch = "clear && fastfetch";
      dwight = "~/.config/asciiArt/asciiArt.sh dwight";
      catbox = "~/.config/asciiArt/asciiArt.sh catBox";
      deer = "~/.config/asciiArt/asciiArt.sh deer";
      squirrel = "~/.config/asciiArt/asciiArt.sh squirrel";
      ridgecrest = "~/.config/asciiArt/asciiArt.sh ridgecrest";
      ridgecrest_small = "~/.config/asciiArt/asciiArt.sh ridgecrest_small";
      isaiah = "~/.config/asciiArt/asciiArt.sh isaiah";
      ascii = "~/.config/asciiArt/asciiArt.sh";

      # Quick-edit shortcuts (work in any DE; harmless if files don't exist)
      ch = "vim ~/.config/hypr/hyprland.conf";
      cw = "vim ~/.config/waybar/config.jsonc";
      cws = "vim ~/.config/waybar/style.css";
      ck = "vim ~/.config/kitty/kitty.conf";
    };

    initExtra = ''
      # Prompt
      PS1='\e[0;34m󰣇  \u \W >\e[0m '

      # Your Arch bashrc set these; they were Pi-/driver-specific.
      # Keep them out of shell state unless we *know* they're correct for the machine.
      # export WLR_RENDERER=vulkan
      # export LIBVA_DRIVER_NAME=v3d

      # "cd" that auto-lists
      cd() {
        builtin cd "$1" && ll
      }
    '';
  };

  # Keep your existing vimrc as-is
  home.file.".vimrc".source = ../../files/vimrc;
}
