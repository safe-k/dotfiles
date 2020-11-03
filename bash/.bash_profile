#!/usr/bin/env bash

# Set Neovim as global editor
VISUAL=nvim
EDITOR="${VISUAL}"

# History
## Bind arrow keys to history search functions
if [[ $- == *i* ]]; then
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi
## Infinite history
export HISTSIZE=""
## Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Git
## Load command line auto completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
fi

# Prompt
export PS1="\[\033[1;33m\]>\[\033[0m\] "

# Aliases
## Vim
alias vim="nvim"
alias vimf="vim \$(fzf)"
alias vimedit="vim ~/.vimrc"
## Tmux
alias tmuxedit="vim ~/.tmux.conf"
## Alacritty
alias alacedit="vim ~/.config/alacritty/alacritty.yml"
## Bash
alias ls="ls -la"
alias bashedit="vim ~/.bash_profile"
alias bashsrc="source ~/.bash_profile"
## Git
alias gs="git status"
__git_complete gs _git_status
alias gb="git branch"
__git_complete gb _git_branch
## Tree
alias tr="tree -a -I '.git|node_modules|vendor'"

# Functions
## Bash
path() {
  echo "${PATH//:/$'\n'}"
}
pathmunge() {
  if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)"; then
    if [ "$2" = "before" ]; then
      PATH="$1:$PATH"
    else
      PATH="$PATH:$1"
    fi
  fi
}
google() {
  if [ -z "${*}" ]; then
    echo "Query is empty"
    return 1
  fi

  open "https://google.com/search?q=${*}"
}

# Load Local bash profile (Note: This is done last in order to allow overrides)
if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
