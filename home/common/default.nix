{ config, pkgs, ... }:
{
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";

  home.stateVersion = "24.11";

  imports = [
    ../modules/shell
    ../modules/palette
    ../modules/asciiArt
    ../modules/kitty
  ];

  # Cursor
  home.pointerCursor = {
     name = "Bibata-Modern-Ice";
     size = 26;
     package = pkgs.bibata-cursors;
  };
}
