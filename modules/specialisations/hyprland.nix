{ config, pkgs, ... }:
{
  specialisation.hyprland.configuration = {
    # Display/login for Hyprland
    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
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

    environment.systemPackages = with pkgs; [
      kitty
      waybar
      rofi-wayland
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

    # Home Manager layer for Hyprland (configs, scripts, waybar/rofi themes)
    home-manager.users.caleb.imports = [ ../../home/specialisations/hyprland ];
  };
}
