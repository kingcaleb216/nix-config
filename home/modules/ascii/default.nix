{ config, pkgs, ... }:
{
  # Provide your ASCII art tool + art files in one predictable place.
  home.file = {
    ".config/asciiArt/asciiArt.sh" = {
      source = ../../../assets/asciiArt/asciiArt.sh;
      executable = true;
    };

    ".config/asciiArt/dwight".source = ../../../assets/asciiArt/dwight;
    ".config/asciiArt/catBox".source = ../../../assets/asciiArt/catBox;
    ".config/asciiArt/deer".source = ../../../assets/asciiArt/deer;
    ".config/asciiArt/squirrel".source = ../../../assets/asciiArt/squirrel;
    ".config/asciiArt/ridgecrest".source = ../../../assets/asciiArt/ridgecrest;
    ".config/asciiArt/ridgecrest_small".source = ../../../assets/asciiArt/ridgecrest_small;
    ".config/asciiArt/isaiah".source = ../../../assets/asciiArt/isaiah;
  };

  # Runtime deps for the script:
  home.packages = with pkgs; [ bc coreutils gnugrep gnused util-linux ];
}
