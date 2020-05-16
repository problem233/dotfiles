#!/bin/bash

source ~/.environment

set -o noclobber
shopt -s checkwinsize

export PS1="\[$(tput setaf 6)\]\w\[$(tput setaf 2)\] \\$ \[$(tput sgr0)\]"
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='\: *:\:'
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

function mkd() {
  mkdir -p $1
  cd $1
}

function useIdris2() {
  export PATH=/mnt/Documents/build/idris2/build/bin:$PATH
}

alias clear!='history -w && clear && xkeys Control_L Shift_L X'

function xshowkey() {
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

