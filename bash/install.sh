#!/usr/bin/env bash

# Path
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install useful tools

## Brew

### Tree https://formulae.brew.sh/formula/tree
brew install tree

### fzf https://github.com/junegunn/fzf
brew install fzf

## Curl (bin)

### Nav https://github.com/safe-k/nav
cd "${DIR}/../bin" && curl -OJ https://raw.githubusercontent.com/safe-k/nav/master/nav && cd - || return 1

# Symlink

## profile
ln -sfv "${DIR}/.bash_profile" ~

## bin
ln -sfv "${DIR}/../bin" ~

# Load new profile

# shellcheck source=.bash_profile
source ~/.bash_profile
