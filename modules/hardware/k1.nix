{ config, pkgs, ... }:
{
  # AMD CPU microcode
  hardware.cpu.amd.updateMicrocode = true;

  # Graphics stack
  hardware.graphics.enable = true;

  # Laptop-ish defaults (safe on mini PC too)
  services.fstrim.enable = true;

  # If you ever need Pi-specific env vars (you don't on this box),
  # keep them out of your shell config and put them here instead.
  # environment.sessionVariables = {
  #   WLR_RENDERER = "vulkan";
  # };
}
