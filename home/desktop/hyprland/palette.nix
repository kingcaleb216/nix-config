{ pkgs, ... }:

let
  p = {
    black = "1e1e1e";
    red = "b3626e";
    green = "6d9e4e";
    yellow = "9b8850";
    blue = "54789f";
    magenta = "8d6a91";
    cyan = "4c8a8a";
    white = "d4d4d4";
    light_black = "5a5a5a";
    light_red = "e37d8c";
    light_green = "95d16f";
    light_yellow = "b9a95c";
    light_blue = "7da1c0";
    light_magenta = "a988aa";
    light_cyan = "60aaaa";
    light_white = "f0f0f0";
  };

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
in
{
  home.file = {
    ".config/palette/kitty/colors.conf".source = kittyColors;
    ".config/palette/hypr/colors.conf".source = hyprColors;
  };
}

