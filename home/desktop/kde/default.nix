{ config, pkgs, ... }:
{
  # Kdiff3 config
  xdg.configFile."kdiff3rc".source =
   config.lib.file.mkOutOfStoreSymlink "/home/caleb/nix-config/home/files/kdiff3/kdiff3rc";

  xdg.configFile."specialisation_aliases.sh".text = ''
    # KDE specialisation
    alias rebuild="sudo nixos-rebuild switch --flake /home/caleb/nix-config#k1 --specialisation kde"
  '';
}
