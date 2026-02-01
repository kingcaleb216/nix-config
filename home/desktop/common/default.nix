{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    orca-slicer
    vscode
    kdePackages.okular
    wl-clipboard
    tree
  ];
  
#------------------------------------------
# Shell
#------------------------------------------

  home.file.".bashrc".source =
  config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/shell/.bashrc";

  home.file.".vimrc".source =
  config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/shell/.vimrc";
}
