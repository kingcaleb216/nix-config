{ config, pkgs, ... }:
{
  home.file = {
    ".config/hypr/hyprland.conf".source = ../../files/hypr/hyprland.conf;

    ".config/hypr/initLayout.sh" = {
      source = ../../files/hypr/initLayout.sh;
      executable = true;
    };
    ".config/hypr/clearWorkspace.sh" = {
      source = ../../files/hypr/clearWorkspace.sh;
      executable = true;
    };
    ".config/hypr/toggleTerminal.sh" = {
      source = ../../files/hypr/toggleTerminal.sh;
      executable = true;
    };

    # Wallpaper placeholder (drop your image at this path)
    ".config/wallpaper/README.txt".source = ../../files/wallpaper/README.txt;
  };

  # Nice-to-have Hyprland utilities
  home.packages = with pkgs; [
    hyprland
    swww
    grim
    slurp
    wl-clipboard
    mako
    pavucontrol
    thunar
    tumbler
    gvfs
  ];
}
