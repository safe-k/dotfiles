#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink and load profile
ln -sfv "${DIR}/.bash_profile" ~
# shellcheck source=.bash_profile
source ~/.bash_profile
