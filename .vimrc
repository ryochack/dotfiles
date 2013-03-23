"設定のリセット
highlight clear
syntax clear
mapclear
mapclear!
"vim機能を有効にする
set nocompatible

"vim-plugin開発用 最小限の設定で起動
let s:test_vimrc_name=getcwd().'/.vimrc.test'
if filereadable(s:test_vimrc_name)
	source `=s:test_vimrc_name`
endif
if exists("g:loaded_vim_plugin_test_vimrc")
	source ~/.vim/preferences/tiny.vimrc
	finish
endif

"Bundle管理されているpluginを読み込む
source ~/.vim/preferences/bundle.vimrc
"Plugin設定
source ~/.vim/preferences/plugin.vimrc

"基本設定
source ~/.vim/preferences/general.vimrc
"編集関連
source ~/.vim/preferences/edit.vimrc
"ファイル設定
source ~/.vim/preferences/file.vimrc
"表示設定
source ~/.vim/preferences/appearance.vimrc

