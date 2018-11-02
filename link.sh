#!/bin/sh

set -eu

# vim
ln -is ~/.dotfiles/vimrc ~/.vimrc
ln -is ~/.dotfiles/vim ~/.vim
#ln -is ~/.dotfiles/gvimrc ~/.gvimrc
install -d vim/temp/backupfile
install -d vim/temp/swapfile

# git
ln -is ~/.dotfiles/gitconfig ~/.gitconfig
ln -is ~/.dotfiles/gitignore ~/.gitignore
ln -is ~/.dotfiles/tigrc ~/.tigrc

# tmux
ln -is ~/.dotfiles/tmux.conf ~/.tmux.conf

# shell
ln -is ~/.dotfiles/bash_profile ~/.bash_profile
ln -is ~/.dotfiles/bashrc ~/.bashrc
#ln -is ~/.dotfiles/cshrc ~/.cshrc
ln -is ~/.dotfiles/zshrc ~/.zshrc
ln -is ~/.dotfiles/zplugrc ~/.zplugrc
ln -is ~/.dotfiles/zfunc ~/.zfunc
#ln -is ~/.dotfiles/zshrc.custom ~/.zshrc.custom

# xorg
ln -is ~/.dotfiles/xorg/xinitrc ~/.xinitrc
ln -is ~/.dotfiles/xorg/Xresources ~/.Xresources
ln -is ~/.dotfiles/xorg/Xmodmap ~/.Xmodmap

# config
sh config/link.sh

# service
ln -is ~/.dotfiles/archlinux/service ~/service
