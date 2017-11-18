#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
PS1='[\u@\h \W]\$ '

source $HOME/.profile

if [ -x /usr/bin/zsh ]; then
    exec /usr/bin/zsh
fi
