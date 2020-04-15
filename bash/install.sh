#!/usr/bin/env bash

# Path
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install useful tools

## Brew

brew tap safe-k/tap

### Tree https://formulae.brew.sh/formula/tree
brew install tree

### fzf https://github.com/junegunn/fzf
brew install fzf

### Nav https://github.com/safe-k/nav
brew install nav

# Symlink

## profile
ln -sfv "${DIR}/.bash_profile" ~

## bin
ln -sfv "${DIR}/../bin" ~

# Load new profile

# shellcheck source=.bash_profile
source ~/.bash_profile
