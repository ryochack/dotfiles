#!/bin/sh
set -eu

SCRIPT_DIR="$(cd $(dirname $0); pwd)"

# vim
ln -is ${SCRIPT_DIR}/vimrc ~/.vimrc
ln -is ${SCRIPT_DIR}/vim ~/.vim
install -d vim/temp/backupfile
install -d vim/temp/swapfile

# git
ln -is ${SCRIPT_DIR}/gitconfig ~/.gitconfig
ln -is ${SCRIPT_DIR}/gitignore ~/.gitignore

# tmux
ln -is ${SCRIPT_DIR}/tmux.conf ~/.tmux.conf

# shell
ln -is ${SCRIPT_DIR}/bashrc ~/.bashrc
ln -is ${SCRIPT_DIR}/inputrc ~/.inputrc

