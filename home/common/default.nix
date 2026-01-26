{ config, pkgs, ... }:
{
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";

  home.stateVersion = "24.11";

  imports = [
    ../desktop/common
  ];

  # Cursor
  home.pointerCursor = {
     name = "Bibata-Modern-Ice";
     size = 26;
     package = pkgs.bibata-cursors;
  };
}
