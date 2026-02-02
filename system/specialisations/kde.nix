{ config, pkgs, ... }:
{
  specialisation.kde.configuration = {
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Nice-to-have for KDE apps needing polkit
    security.polkit.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.konsole
    ];

    # Home Manager layer for KDE (minimal for now)
    home-manager.users.caleb.imports = [ ../../home/modules/kde ];
  };
}
