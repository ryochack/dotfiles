#!/bin/sh

set -eu

ln -is ~/.dotfiles/archlinux/.xinitrc ~/.xinitrc
ln -is ~/.dotfiles/archlinux/.Xdefaults ~/.Xdefaults
ln -is ~/.dotfiles/archlinux/.Xresources ~/.Xresources
ln -is ~/.dotfiles/archlinux/service ~/service
if [ ! -e ~/.config ]; then
	mkdir ~/.config
fi
ln -is ~/.dotfiles/archlinux/.config/i3 ~/.config/i3
