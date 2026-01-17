{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-wayland ];

  home.file.".config/rofi/config.rasi".source = ../../files/rofi/config.rasi;
  home.file.".config/rofi/theme.rasi".source = ../../files/rofi/theme.rasi;
}
