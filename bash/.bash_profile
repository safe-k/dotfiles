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
export PS1="\[\033[1;33m\]\W\[\033[1;34m\]\$(__git_ps1 ' (%s)')\[\033[1;33m\] >\[\033[0m\] "

# Aliases

## Bash
alias bashrld="source ~/.bash_profile"
alias localip="ipconfig getifaddr en0"
alias path='echo -e ${PATH//:/\\n}'

### Tree
alias lst="tree -a -L 1 $1"

## Git
alias gs="git status"

# Functions

## Bash
pathmunge () {
        if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH="$PATH:$1"
           else
              PATH="$1:$PATH"
           fi
        fi
}

# Load Local bash profile (Note: This is done last in order to allow overrides)
if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi
