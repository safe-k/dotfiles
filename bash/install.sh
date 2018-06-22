#!/usr/bin/env bash

# Path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink profile
ln -sfv "$DIR/.bash_profile" ~

# Load new profile
source ~/.bash_profile

