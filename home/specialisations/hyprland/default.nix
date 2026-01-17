{ config, pkgs, ... }:
{
  imports = [
    ../../modules/hyprland
    ../../modules/waybar
    ../../modules/rofi
  ];

  # Kdiff3 config (harmless even if you don't use it in Hyprland)
  home.file.".config/kdiff3rc".source = ../../files/kdiff3/kdiff3rc;

  xdg.configFile."specialisation_aliases.sh".text = ''
    # Hyprland specialisation
    alias ch="vim ~/nix-config/home/files/hypr/hyprland.conf"
    alias cw="vim ~/nix-config/home/files/waybar/config.jsonc"
    alias cws="vim ~/nix-config/home/files/waybar/style.css"
    alias ck="vim ~/nix-config/home/files/kitty/kitty.conf"
    alias rebuild="sudo nixos-rebuild switch --flake /home/caleb/nix-config#k1 --specialisation hyprland";
  '';

  # If you want the "dashboard" at login, your hyprland.conf likely triggers initLayout.sh.
  # If you later want it *conditional* or *commented out*, we can turn this into a user systemd unit.
}
