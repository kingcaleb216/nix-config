{ config, pkgs, ... }:
let
  p = import ./palette.nix;

  kittyColors = pkgs.writeText "kitty-colors.conf" ''
    color0  #${p.black}
    color1  #${p.red}
    color2  #${p.green}
    color3  #${p.yellow}
    color4  #${p.blue}
    color5  #${p.magenta}
    color6  #${p.cyan}
    color7  #${p.white}
    color8  #${p.light_black}
    color9  #${p.light_red}
    color10 #${p.light_green}
    color11 #${p.light_yellow}
    color12 #${p.light_blue}
    color13 #${p.light_magenta}
    color14 #${p.light_cyan}
    color15 #${p.light_white}
  '';

  hyprColors = pkgs.writeText "hypr-colors.conf" ''
    $black = 0xee${p.black}
    $red = 0xee${p.red}
    $green = 0xee${p.green}
    $yellow = 0xee${p.yellow}
    $blue = 0xee${p.blue}
    $magenta = 0xee${p.magenta}
    $cyan = 0xee${p.cyan}
    $white = 0xee${p.white}
    $light_black = 0xee${p.light_black}
    $light_red = 0xee${p.light_red}
    $light_green = 0xee${p.light_green}
    $light_yellow = 0xee${p.light_yellow}
    $light_blue = 0xee${p.light_blue}
    $light_magenta = 0xee${p.light_magenta}
    $light_cyan = 0xee${p.light_cyan}
    $light_white = 0xee${p.light_white}
  '';

  waybarColors = pkgs.writeText "waybar-colors.css" ''
    @define-color black #${p.black};
    @define-color red #${p.red};
    @define-color green #${p.green};
    @define-color yellow #${p.yellow};
    @define-color blue #${p.blue};
    @define-color magenta #${p.magenta};
    @define-color cyan #${p.cyan};
    @define-color white #${p.white};
    @define-color light_black #${p.light_black};
    @define-color light_red #${p.light_red};
    @define-color light_green #${p.light_green};
    @define-color light_yellow #${p.light_yellow};
    @define-color light_blue #${p.light_blue};
    @define-color light_magenta #${p.light_magenta};
    @define-color light_cyan #${p.light_cyan};
    @define-color light_white #${p.light_white};
  '';
in
{
  home.file = {
    ".config/kitty/colors.conf".source = kittyColors;
    ".config/hypr/colors.conf".source = hyprColors;
    ".config/waybar/colors.css".source = waybarColors;
  };
}
