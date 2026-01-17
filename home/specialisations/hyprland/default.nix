{ config, pkgs, ... }:
{
  imports = [
    ../../modules/hyprland
    ../../modules/waybar
    ../../modules/rofi
  ];

  # Kdiff3 config (harmless even if you don't use it in Hyprland)
  home.file.".config/kdiff3rc".source = ../../files/kdiff3/kdiff3rc;

  # If you want the "dashboard" at login, your hyprland.conf likely triggers initLayout.sh.
  # If you later want it *conditional* or *commented out*, we can turn this into a user systemd unit.
}
