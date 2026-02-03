{ config, pkgs, ... }:
{
  home.username = "caleb";
  home.homeDirectory = "/home/caleb";

  home.stateVersion = "24.11";

  # Cursor
  home.pointerCursor = {
     name = "Bibata-Modern-Ice";
     size = 26;
     package = pkgs.bibata-cursors;
  };

  # Common packages
  home.packages = with pkgs; [
    orca-slicer
    vscode
    kdePackages.okular
    obsidian
  ];
  
#------------------------------------------
# Shell Config
#------------------------------------------

  home.file.".bashrc".source =
  config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/shell/.bashrc";

  home.file.".vimrc".source =
  config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/shell/.vimrc";
}
