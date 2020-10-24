#!/usr/bin/env bash

echo "Staring installation.."

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

brew update
brew bundle

for directory in $DIR/*; do
  if [ -d "$directory" ]; then
    for file in $(find "$directory" -type f -name "install.sh"); do
      source "$file"
    done
  fi
done

echo "Installation complete."
