#!/usr/bin/env bash

# Path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install useful bash tools

alias bi="brew list $1 || brew install $1"

## Tree https://formulae.brew.sh/formula/tree
bi tree

# Symlink profile
ln -sfv "$DIR/.bash_profile" ~

# Load new profile
source ~/.bash_profile
