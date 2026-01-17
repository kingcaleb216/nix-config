{ config, pkgs, ... }:
{
  home.file.".bashrc".source =
  config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/shell/.bashrc";

  home.file.".vimrc".source =
  config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/shell/.vimrc";
}
