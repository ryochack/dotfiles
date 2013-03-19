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
	source ~/.vim/preferences/.vimrc.tiny
	finish
endif

"Bundle管理されているpluginを読み込む
source ~/.vim/preferences/.vimrc.bundle
"Plugin設定
source ~/.vim/preferences/.vimrc.plugins

"基本設定
source ~/.vim/preferences/.vimrc.basic
"StatusLine設定
source ~/.vim/preferences/.vimrc.statusline
"Indent設定
source ~/.vim/preferences/.vimrc.indent
"折り畳み設定
source ~/.vim/preferences/.vimrc.fold
"表示関連
source ~/.vim/preferences/.vimrc.appearance
"補完関連
source ~/.vim/preferences/.vimrc.complement
"Tags関連
source ~/.vim/preferences/.vimrc.tags
"検索関連
source ~/.vim/preferences/.vimrc.search
"移動関連
source ~/.vim/preferences/.vimrc.move
"色関連
source ~/.vim/preferences/.vimrc.colors
"編集関連
source ~/.vim/preferences/.vimrc.edit
"ファイルタイプ読み込み設定
source ~/.vim/preferences/.vimrc.filetype
"Encoding関連
source ~/.vim/preferences/.vimrc.encode
"その他
source ~/.vim/preferences/.vimrc.misc


