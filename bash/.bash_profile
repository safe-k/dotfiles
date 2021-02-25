#!/usr/bin/env bash
source "$(brew --prefix)/etc/bash_completion"
export PS1="\[\033[1;33m\]$\[\033[0m\] "

export HISTSIZE='' # Infinite history
export HISTCONTROL='ignoredups:erasedups' # Avoid history duplicates
if [[ $- == *i* ]]; then # Bind arrow keys to history search functions
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi

alias bashedit="\${EDITOR} ~/.bash_profile"
alias basheditloc="\${EDITOR} \${HOME}/.bash_profile.local"
alias bashsrc='source ~/.bash_profile'
alias ls='ls -la'

path() { echo "${PATH//:/$'\n'}"; }
path_append() {
  { ! echo "${PATH}" | grep -Eq "(^|:)$1($|:)"; } && PATH="${PATH}:$1"
}

{ # Tools
  # alacritty + tmux
  alias alacedit="\${EDITOR} ~/.config/alacritty/alacritty.yml"
  alias tmuxedit="\${EDITOR} ~/.tmux.conf"
  # git
  alias gs='git status'; __git_complete gs _git_status
  alias gb='git branch'; __git_complete gb _git_branch
  alias gc='git checkout'; __git_complete gc _git_checkout
  alias gl='git log --graph --oneline --decorate'; __git_complete gl _git_log
  # neovim
  export EDITOR='nvim'
  export VISUAL="\${EDITOR}"
  alias vimedit="\${EDITOR} ~/.config/nvim/init.vim"
  vim() { nvim "${1:-.}"; }
  # fzf + ripgrep
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
  export FZF_DEFAULT_OPTS='--height 40% --layout reverse --info inline --border'
  ff() {
    local res; res="$(fzf --preview 'cat {}')" \
      && [[ -n "${res}" ]] \
      && "${EDITOR}" "${res}"
  }
  # man
  man() { # Colorise pages
    LESS_TERMCAP_mb=$'\e[1;32m' \
    LESS_TERMCAP_md=$'\e[1;32m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;4;31m' \
    command man "$@"
  }
}

# Load Local bash profile (Note: This is done last in order to allow overrides)
[[ ! -f ~/.bash_profile.local ]] || source ~/.bash_profile.local
