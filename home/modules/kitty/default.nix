{ config, pkgs, ... }:
{
  programs.kitty = {
  enable = true;

  extraConfig = ''
    include ../palette/kitty/colors.conf
    background_opacity 0.8
    allow_remote_control yes
    confirm_os_window_close 0
  '';
  };
}
