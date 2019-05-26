#!/bin/sh

set -eu

install -d ~/.config

# config
ln -is ~/.dotfiles/config/i3 ~/.config/i3
ln -is ~/.dotfiles/config/zathura ~/.config/zathura

