#!/bin/sh

# cmigemo install
hg clone https://code.google.com/p/cmigemo/ ~/.vim/opt/cmigemo
cd ~/.vim/opt/cmigemo
./configure
make osx
make osx-dict
./build/cmigemo -d dict/utf-8.d/migemo-dict
make osx-install
mkdir -p ~/.vim/bundle/cmigemo/plugin
ln -s ~/.vim/opt/cmigemo/tools/migemo.vim ~/.vim/bundle/cmigemo/plugin/migemo.vim

# google golang (brewでは$GOROOT定義なし)
ln -s $GOROOT/misc/vim ~/.vim/bundle/golang

