#!/bin/sh

set -eu

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
zplug install
