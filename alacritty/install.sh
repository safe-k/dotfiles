#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink config
mkdir -p ~/.config/alacritty
ln -sfv "${DIR}/alacritty.yml" ~/.config/alacritty/.

