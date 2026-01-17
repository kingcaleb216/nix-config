{ config, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  # Locale / timezone
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Users
  users.users.caleb = {
    isNormalUser = true;
    description = "Caleb";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bashInteractive;
  };

  # Basic tools
  environment.systemPackages = with pkgs; [
    git
    vim
    nano
    jq
    bc
    tldr
    which
    usbutils
    nettools
    openssh
    fastfetch
    btop
    htop
    bat
  ];

  # Audio (Wayland-friendly)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;

  # Fonts (Waybar icons)
  fonts.packages = with pkgs; [
    font-awesome
  ];

  # Allow unfree packages (Brave, etc.)
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # set once at install time
}
