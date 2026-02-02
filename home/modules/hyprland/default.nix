{ config, pkgs, ... }:
{
  imports = [
    ./asciiArt.nix
    ./hyprpanel.nix
    ./kitty.nix
    ./palette.nix
    ./rofi.nix
  ];

  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/hypr";

  xdg.configFile."wallpaper".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/wallpaper";

  xdg.configFile."specialisation_aliases.sh".text = ''
    # Hyprland specialisation
    alias ch="vim ~/nix-config/home/files/hypr/hyprland.conf"
    alias cp="vim ~/nix-config/home/files/hyprpanel/config.json"
    alias ck="vim ~/nix-config/home/files/kitty/kitty.conf"
    alias rebuild="sudo nixos-rebuild switch --flake /home/caleb/nix-config#k1 --specialisation hyprland";
  '';
}
