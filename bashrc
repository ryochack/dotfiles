#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignorespace:erasedups
export HISTIGNORE=ls:exit:history
export HISTSIZE=4000
export HISTFILESIZE=8000

# erase by Ctrl-W to slash
stty werase undef
bind '\C-w:unix-filename-rubout'

alias ls='ls --color=auto -F'
alias ll='ls -alF'
alias la='ls -AF'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias g='git'

PS1='[\u@\h \W]\$ '

source $HOME/.profile

if [ -x /usr/bin/zsh ]; then
    exec /usr/bin/zsh
fi

