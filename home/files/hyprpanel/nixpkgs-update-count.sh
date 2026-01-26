#!/usr/bin/env bash
set -euo pipefail

# Prints "1" if your nixpkgs input is behind upstream, else "0".
# Used by hyprpanel custom/packages.

flake_dir="${1:-$HOME/nix-config}"

if ! command -v nix >/dev/null 2>&1; then
  echo 0
  exit 0
fi
if ! command -v jq >/dev/null 2>&1; then
  echo 0
  exit 0
fi

# Locked rev for nixpkgs in your local flake
locked_rev=$(nix flake metadata --json "${flake_dir}" 2>/dev/null \
  | jq -r '.locks.nodes.nixpkgs.locked.rev // empty')

if [[ -z "${locked_rev}" ]]; then
  echo 0
  exit 0
fi

# Current upstream rev (same branch you pinned in flake.nix)
upstream_rev=$(nix flake metadata --json "github:NixOS/nixpkgs/nixos-unstable" 2>/dev/null \
  | jq -r '.revision // empty')

if [[ -z "${upstream_rev}" ]]; then
  echo 0
  exit 0
fi

if [[ "${locked_rev}" != "${upstream_rev}" ]]; then
  echo 1
else
  echo 0
fi
