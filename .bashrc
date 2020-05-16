#!/bin/bash

set -o noclobber
shopt -s expand_aliases
shopt -s checkwinsize

export PATH=~/.local/bin:$PATH
export LANG="zh_CN.UTF-8"

export PS1="\[$(tput setaf 6)\]\w\[$(tput setaf 2)\] \\$ \[$(tput sgr0)\]"

export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='\: *:\:'

export SUDO_EDITOR=vim
export EDITOR=vim

alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -Ahl --color=auto'
alias :q=exit

function mkd() {
  mkdir -p $1
  cd $1
}

alias clear!='history -w && clear'

