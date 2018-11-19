#!/bin/bash

source ~/.environment

export PS1="\[$(tput setaf 6)\]\w\[$(tput setaf 2)\] \\$ \[$(tput sgr0)\]"
export HISTCONTROL=ignoreboth:erasedups
export SUDO_EDITOR=vim
if ! xset q &>/dev/null; then
  export EDITOR=vim
else
  export EDITOR='code -w'
fi

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -Ahl --color=auto'
alias :q=exit
