#!/bin/sh
set -eu

SCRIPT_DIR="$(cd $(dirname $0); pwd)"

install -d ~/.config

# config
ln -is ${SCRIPT_DIR}/i3 ~/.config/i3
ln -is ${SCRIPT_DIR}/zathura ~/.config/zathura

# xorg
ln -is ${SCRIPT_DIR}/xorg/xinitrc ~/.xinitrc
ln -is ${SCRIPT_DIR}/xorg/Xresources ~/.Xresources
ln -is ${SCRIPT_DIR}/xorg/Xmodmap ~/.Xmodmap

