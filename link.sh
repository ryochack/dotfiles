#!/bin/sh

set -eu

ln -is ~/.dotfiles/.bash_profile ~/.bash_profile
ln -is ~/.dotfiles/.bashrc ~/.bashrc
#ln -is ~/.dotfiles/.cshrc ~/.cshrc
#ln -is ~/.dotfiles/.zshrc ~/.zshrc
#ln -is ~/.dotfiles/.zshrc.custom ~/.zshrc.custom
ln -is ~/.dotfiles/.vimrc ~/.vimrc
ln -is ~/.dotfiles/.gvimrc ~/.gvimrc
ln -is ~/.dotfiles/.vim ~/.vim
ln -is ~/.dotfiles/.gitconfig ~/.gitconfig
ln -is ~/.dotfiles/.gitignore ~/.gitignore
ln -is ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -is ~/.dotfiles/.tigrc ~/.tigrc

if [ $# -eq 0 ]; then
    exit 0
fi

target=$1

if [ "${target}" = "arch" ]; then
	ln -is ~/.dotfiles/archlinux/.xinitrc ~/.xinitrc
	ln -is ~/.dotfiles/archlinux/.Xdefaults ~/.Xdefaults
	ln -is ~/.dotfiles/archlinux/.Xresources ~/.Xresources
	ln -is ~/.dotfiles/service ~/service
fi
