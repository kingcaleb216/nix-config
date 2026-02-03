{ config, pkgs, ... }:
{
  imports = [
    ../../modules/common.nix
    ../../modules/hyprland.nix
    ../../modules/kde.nix

    ./hardware-configuration.nix
  ];

  networking.hostName = "k1";

  # AMD CPU microcode
  hardware.cpu.amd.updateMicrocode = true;

  # Graphics stack
  hardware.graphics.enable = true;

  # Laptop default enabled for mini PC
  services.fstrim.enable = true;
}
