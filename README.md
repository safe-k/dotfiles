# dotfiles

Minimal command line configurations for an OSX development environment.

## Installation

The main `install.sh` script will run all other installation scripts (also named `install.sh`) in subdirectories.

```bash
git clone git@github.com:safe-k/dotfiles.git ~/.dotfiles
source ~/.dotfiles/install.sh
```

On installation, you will be prompted to enter your Git credentials to be set globally.

## Local Profiles

Local profiles can be created in the root directory (`~/*`) for the following:

| Profile        | Supported Local Version |
| -------------- | ----------------------- |
| .bash\_profile | .bash\_profile.local    |
| .vimrc         | .vimrc.local            |
