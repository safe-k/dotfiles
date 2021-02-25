#!/usr/bin/env bash

echo 'Staring installation..'

declare DOT_DIR; DOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" || exit 1

{ brew update && brew bundle; } || exit 1 

for directory in ${DOT_DIR}/*; do
  if [ -d "${directory}" ]; then
    for file in $(find "${directory}" -type f -name 'install.sh'); do
      source "${file}"
    done
  fi
done

echo 'Installation complete.'
