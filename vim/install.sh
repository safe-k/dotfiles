#!/usr/bin/env bash

# Path
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink config
ln -sfv "${DIR}/.vimrc" ~

# Install plugins 
vim +PlugInstall +qall > /dev/null
