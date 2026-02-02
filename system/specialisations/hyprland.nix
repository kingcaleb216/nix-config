{ config, pkgs, ... }:
{
  specialisation.hyprland.configuration = {
    # Display/login for Hyprland
    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland";
        user = "greeter";
      };
    };

    programs.hyprland.enable = true;

    # Portals for screen sharing, file pickers, etc.
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
    };

    security.polkit.enable = true;

    services.power-profiles-daemon.enable = true;

    environment.systemPackages = with pkgs; [
      hyprland
      kitty
      rofi
      swww
      grim
      slurp
      wl-clipboard
      mako
      pavucontrol
      thunar
      tumbler
      gvfs
      brave
    ];

    # Home Manager layer for Hyprland (configs, scripts, hyprpanel/rofi themes)
    home-manager.users.caleb.imports = [ ../../home/modules/hyprland ];
  };
}
