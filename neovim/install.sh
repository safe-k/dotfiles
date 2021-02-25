#!/usr/bin/env bash

# Path
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_PATH="${XDG_DATA_HOME:-$HOME/.config}/nvim"
mkdir -p "${CONFIG_PATH}"

# Install vim-plug
# See https://github.com/junegunn/vim-plug#neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Symlink config
ln -sfv "${DIR}/init.vim" "${CONFIG_PATH}/init.vim"

# Install plugins 
nvim +PlugInstall +qall >/dev/null
