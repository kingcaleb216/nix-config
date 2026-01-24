{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    orca-slicer
    vscode
    kdePackages.okular
  ];
}
