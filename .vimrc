"設定のリセット
highlight clear
syntax clear
mapclear
mapclear!
autocmd!
"vim機能を有効にする
set nocompatible

syntax off
filetype off
filetype plugin indent off


" Bundled Plugins
source ~/.vim/preferences/bundle.vimrc
" Plugins
source ~/.vim/preferences/plugin.vimrc

" Filetypes
source ~/.vim/preferences/filetype.vimrc
" Filetype Plugins
source ~/.vim/preferences/plugin_filetype.vimrc

"pluginのcolorschemeの設定を有効にした後にbase.vimrcの設定を反映する
syntax enable

" KeyBinds
source ~/.vim/preferences/keybind.vimrc
" Base Setting
source ~/.vim/preferences/base.vimrc

filetype plugin indent on

