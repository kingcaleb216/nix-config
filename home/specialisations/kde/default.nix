{ config, pkgs, ... }:
{
  # Intentionally minimal; KDE writes lots of GUI-managed config files.
  # We keep Home Manager from trying to "own" Plasma config unless you later add plasma-manager.
  home.packages = with pkgs; [ ];
}
