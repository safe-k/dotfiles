# History
## Bind arrow keys to history search functions
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
## Infinite history
export HISTSIZE=""
## Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Git
## Load command line auto completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi

# Prompt (Note: This is done after GIT installation in order to use the __git_ps1 variable)
export PS1="\[\033[1;33m\]\W \[\033[1;34m\]\$(__git_ps1 '(%s)')\[\033[1;33m\] >\[\033[0m\] "

# Load aliases
source ~/.dotfiles/bash/.aliases

# Load Local bash profile (Note: This is done last in order to allow overrides)
if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi
