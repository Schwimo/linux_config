#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="${HOME}/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bakke' 

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source $BASH_IT/bash_it.sh

EDITOR='vim -w'
set -o vi
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind -x '"\C-r"':reset

shopt -s histappend
PROMPT_COMMAND="$PROMPT_COMMAND;history -a; history -n"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi
