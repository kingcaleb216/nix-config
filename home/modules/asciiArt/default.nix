{ config, pkgs, ... }:
{
  xdg.configFile."asciiArt".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/asciiArt";

  # Runtime deps for the script:
  home.packages = with pkgs; [ bc coreutils gnugrep gnused util-linux ];
}
