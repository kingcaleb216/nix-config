{ config, pkgs, ... }:
{
  imports = [
    ../../modules/base
    ../../modules/hardware/k1.nix
    ../../specialisations/hyprland.nix
    ../../specialisations/kde.nix

    # During install, generate and commit this file:
    #   sudo nixos-generate-config --root /mnt
    #   cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/k1/hardware-configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "k1";
}
