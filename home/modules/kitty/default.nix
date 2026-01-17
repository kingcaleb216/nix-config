{ config, pkgs, ... }:
{
  programs.kitty.enable = true;

  # Keep your kitty.conf as a real file (not inlined)
  home.file.".config/kitty/kitty.conf".source = ../../files/kitty/kitty.conf;
}
