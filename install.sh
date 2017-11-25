#!/bin/sh

set -eu

if [ $# -eq 0 ]; then
    exit 0
fi
target=$1

mkdir -p .vim/temp/swapfile
mkdir -p .vim/temp/backupfile

./download.sh
./link.sh
if [ "${target}" = "arch" ]; then
	./link_arch.sh
fi

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
zplug install
