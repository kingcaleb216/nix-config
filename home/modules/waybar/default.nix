{ config, pkgs, ... }:
let
  updateScript = pkgs.writeShellScriptBin "nixpkgs-update-count" (builtins.readFile ./nixpkgs-update-count.sh);
in
{
  home.packages = with pkgs; [ waybar jq updateScript ];

  home.file.".config/waybar/config.jsonc".source = ../../files/waybar/config.jsonc;
  home.file.".config/waybar/style.css".source = ../../files/waybar/style.css;
}
