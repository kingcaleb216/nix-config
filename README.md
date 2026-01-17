# nix-config

This repo is your **single source of truth** for:
- **System** config (NixOS)
- **Home** config (Home Manager)
- **Desktop specialisations** (KDE vs Hyprland) without cross-contaminating system packages

## Flake basics

- `flake.nix` = the entrypoint. It declares *inputs* (like `nixpkgs`) and *outputs* (your host configs).
- `flake.lock` = the pinned versions of those inputs. It makes rebuilds reproducible.

Updating is usually:
```bash
cd ~/nix-config
nix flake update
sudo nixos-rebuild switch --flake .#k1
```

Rollback is built in (systemd-boot keeps previous generations).

## Host layout

- `hosts/k1/` = anything that is *specific to that machine*
- `modules/` = reusable system modules
- `home/` = Home Manager modules
- `assets/` = literal files you want tracked (ASCII art, etc)

## Desktop switching (specialisations)

Specialisations are built as separate boot entries.
- Rebuild once
- **Reboot**
- Pick the entry:
  - `NixOS - default`
  - `NixOS - hyprland`
  - `NixOS - kde`

## Wallpaper

Drop your image at:
- `~/.config/wallpaper/wallpaper.jpg`

Hyprland runs:
- `swww init` and then `swww img ~/.config/wallpaper/wallpaper.jpg`

## Notes

- Your old Arch `applyPalette.sh` flow has been replaced by a **native Nix palette** that generates:
  - `~/.config/hypr/colors.conf`
  - `~/.config/kitty/colors.conf`
  - `~/.config/waybar/colors.css`

- Waybar "package updates" has been mapped to Nix: it shows **1** when your `nixpkgs` input is behind upstream.
  (We can later make it show a richer status if you want.)
