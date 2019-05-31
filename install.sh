#!/usr/bin/env bash

echo "Staring installation.."

# Path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Homebrew
## Install Homebrew if it doesn't exist
if test ! $(which brew); then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed"
fi
## Update homebrew recipes
brew update

# Source installation scripts in subdirectories
for directory in $DIR/*; do
    if [ -d "$directory" ]; then
        for file in $(find $directory -type f -name "install.sh"); do
            source $file
        done
    fi
done

echo "Installation complete."
