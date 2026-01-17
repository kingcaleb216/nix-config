{ config, pkgs, ... }:
{
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";

  home.stateVersion = "24.11";

  imports = [
    ../modules/shell
    ../modules/theme
    ../modules/ascii
    ../modules/kitty
  ];
}
