{ config, pkgs, ... }:
let
  updateScript = pkgs.writeShellScriptBin "nixpkgs-update-count" (builtins.readFile ./nixpkgs-update-count.sh);
in
{
  home.packages = with pkgs; [
   hyprpanel
   nerd-fonts.jetbrains-mono
   jq
   adwaita-icon-theme
   updateScript ];

   gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  xdg.configFile."hyprpanel".source =
    config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/hyprpanel";
}
