#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$repo_root/neovim"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
target="$config_dir/nvim"

if [[ ! -d "$source_dir" ]]; then
  printf 'Neovim config not found: %s\n' "$source_dir" >&2
  exit 1
fi

mkdir -p "$config_dir"

if [[ -L "$target" && "$(readlink -f -- "$target")" == "$source_dir" ]]; then
  printf 'Neovim config is already linked: %s\n' "$target"
  exit 0
fi

if [[ -e "$target" || -L "$target" ]]; then
  backup="$target.backup.$(date +%Y%m%d-%H%M%S)"
  mv -- "$target" "$backup"
  printf 'Existing Neovim config moved to: %s\n' "$backup"
fi

ln -s -- "$source_dir" "$target"
printf 'Linked Neovim config: %s -> %s\n' "$target" "$source_dir"
