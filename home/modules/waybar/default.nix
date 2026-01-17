{ config, pkgs, ... }:
let
  updateScript = pkgs.writeShellScriptBin "nixpkgs-update-count" (builtins.readFile ./nixpkgs-update-count.sh);
in
{
  home.packages = with pkgs; [ waybar jq updateScript ];

  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/waybar";
}
