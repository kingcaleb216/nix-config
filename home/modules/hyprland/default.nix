{ config, pkgs, ... }:
{
  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/hypr";

  xdg.configFile."wallpaper".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/wallpaper";

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
