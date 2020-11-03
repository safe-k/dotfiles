#!/usr/bin/env bash

# Path
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_PATH="${XDG_DATA_HOME:-$HOME/.config}/nvim"
mkdir -p "${CONFIG_PATH}"

# Symlink config
ln -sfv "${DIR}/init.vim" "${CONFIG_PATH}/init.vim"

# Install plugins 
nvim +PlugInstall +qall > /dev/null
