" this file encoding
scriptencoding utf-8

" reset settings
highlight clear
syntax clear
mapclear
mapclear!
autocmd!

syntax off
filetype off
filetype plugin indent off

" Plugins
source ~/.vim/preferences/plugin.vimrc
" Plugin-settings
source ~/.vim/preferences/plugin_setting.vimrc

" Filetypes
source ~/.vim/preferences/filetype.vimrc

" apply base.vimrc after enabling colorscheme settings on plugin
syntax enable

" KeyBinds
source ~/.vim/preferences/keybind.vimrc
" Base Setting
source ~/.vim/preferences/base.vimrc

filetype plugin indent on

