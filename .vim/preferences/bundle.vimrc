"**********************************************************
"     Plugin管理 ( NeoBundle )
"**********************************************************

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Git Protocol
let g:neobundle_default_git_protocol='https'


" Bundle {{{
	NeoBundleFetch 'Shougo/neobundle.vim'
" }}}


" Text Object {{{
	" textobj-user : 簡単にテキストオブジェクトを作れる
	NeoBundle 'kana/vim-textobj-user'
	" textobj-indent : インデントされたものをtext-object化
	NeoBundle 'kana/vim-textobj-indent'
	" textobj-syntax : シンタックスで定義されたものをtext-object化
	NeoBundle 'kana/vim-textobj-syntax'
	" textobj-function : 関数の中身をtext-object化
	NeoBundle 'kana/vim-textobj-function'
	" textobj-fold : 折り畳みをtext-object化
	NeoBundle 'kana/vim-textobj-fold'
	" textobj-entire : バッファ全体をtext-object化
	NeoBundle 'kana/vim-textobj-entire'
	" textobj-line : 行をtext-object化
	NeoBundle 'kana/vim-textobj-line'
	" textobj-jabraces : 「foo」や【bar】などのブレースをtext-object化
	NeoBundle 'kana/vim-textobj-jabraces'
	" textobj-comment : コメントをtext-object化
	NeoBundle 'thinca/vim-textobj-comment'
	" textobj-between : 任意の区切り文字の間をtext-object化
	NeoBundle 'thinca/vim-textobj-between'
	" textobj-wiw : wordの中の単語をtext-object化
	NeoBundle 'h1mesuke/textobj-wiw'
" }}}


" Operator {{{
	" operator-user : 簡単にoperatorを定義できるようにする
	NeoBundle 'kana/vim-operator-user'
	" operator-replace : Yankしたもので選択範囲を置換する
	NeoBundle 'kana/vim-operator-replace'
	" surround : テキストオブジェクトに対する括弧編集
	NeoBundle 'tpope/vim-surround'
" }}}


" Edit {{{
	" qfreplace : QuickFixの内容を編集
	NeoBundle 'thinca/vim-qfreplace'
	" alignta : マルチバイト文字対応Align
	NeoBundle 'h1mesuke/vim-alignta'
	" yankround : Yank履歴を使用する
	NeoBundle 'LeafCage/yankround.vim'
	" gundo : undo履歴を便利に追えるようにする
	NeoBundle 'sjl/gundo.vim'
	" commentary : コメントアウト (gc[c])
	NeoBundle 'tpope/vim-commentary'
	" fitpaste : 整形して貼り付け
	NeoBundle 'ryochack/fitpaste-vim'
" }}}


" Complement {{{
	" neocomplete : 補完プラグイン
	NeoBundle 'Shougo/neocomplete'
	" neosnippet : スニペット補完
	NeoBundle 'Shougo/neosnippet'
	" neosnippet-snippets : スニペット集
	NeoBundle 'Shougo/neosnippet-snippets'
" }}}


" Read {{{
	" tagbar : ctagsから関数などの定義情報を表示
	NeoBundle 'majutsushi/tagbar'
	" gtags : GNU Globalを使って関数の定義・使用箇所にジャンプ
	NeoBundle 'vim-scripts/gtags.vim'
	" BlockDiff : 選択部分の比較
	NeoBundle 'ryochack/BlockDiff'
	" quickhl : 複数ハイライト
	NeoBundle 't9md/vim-quickhl'
" }}}


" Move {{{
	" smartword : 単語移動を拡張
	NeoBundle 'kana/vim-smartword'
	" visualstar : VisualMode中に*,#で選択されているTextを検索
	NeoBundle 'thinca/vim-visualstar'
" }}}


" Search {{{
	" grep : 外部grep使用
	NeoBundle 'vim-scripts/grep.vim'
	" ag : agを使って検索。:Ag [options] {pattern} [{directory}]
	NeoBundle 'rking/ag.vim'
" }}}


" Filer {{{
	" dirvish : 小さく高速なファイラ
	NeoBundle 'justinmk/vim-dirvish'
	" NerdTree : ツリー型ファイラ
	NeoBundle 'scrooloose/nerdtree.git'
	" vimfiler : 高機能ファイラ
	NeoBundle 'Shougo/vimfiler'
" }}}


" Encoding {{{
	" recognize_charcode : 文字化け解消プラグイン
	NeoBundle 'banyan/recognize_charcode.vim'
" }}}


" Utility {{{
	" localrc : 各ディレクトリのlocal vimrcファイルを置けるようにする
	NeoBundle 'thinca/vim-localrc'
	" quickrun : 編集中のファイルを簡単に実行
	NeoBundle 'thinca/vim-quickrun'
	" vinarise : バイナリエディタ
	NeoBundle 'Shougo/vinarise'
	" vimdoc-ja : vim日本語ドキュメント
	NeoBundle 'vim-jp/vimdoc-ja'
	" lightline : リッチなステータスラインにする
	NeoBundle 'itchyny/lightline.vim'
	" junkfile : 一時ファイル作成
	NeoBundle 'junkfile', {'type':'nosync','base':'~/.vim/bundle'}
	" vimproc : vimから非同期実行
	NeoBundle 'Shougo/vimproc', {
		\ 'build' : {
		\     'windows' : 'tools\\update-dll-mingw',
		\     'cygwin' : 'make -f make_cygwin.mak',
		\     'mac' : 'make -f make_mac.mak',
		\     'linux' : 'make',
		\     'unix' : 'gmake',
		\    },
		\ }
	" webapi : vim Interface to Web API (gistで必要)
	NeoBundle 'mattn/webapi-vim'
	" open-browser : カーソル下のURLを開くor単語を検索エンジンで検索
	NeoBundle 'tyru/open-browser.vim'
	" cecutil : 他のプラグインのためのutility
	NeoBundle 'vim-scripts/cecutil'
" }}}


" CtrlP {{{
	" ctrlp : 正規表現を使ったファイル検索など
	NeoBundle 'kien/ctrlp.vim'
" }}}


" Unite {{{
	" unite : 高機能Interface
	NeoBundle 'Shougo/unite.vim'
" }}}


" Git {{{
	" fugitive : VimからGitを使う
	NeoBundle 'tpope/vim-fugitive'
	" gist : VimからGistを使う
	NeoBundle 'mattn/gist-vim'
" }}}


" FileType {{{
	" vim-go : Go development plugin for Vim
	NeoBundleLazy 'fatih/vim-go'
	autocmd FileType go NeoBundleSource vim-go

	" python-mode : Python設定。docの呼び出し,補完,文法チェック,リファクタリング,Scriptの実行
	NeoBundleLazy 'klen/python-mode'
	autocmd FileType python NeoBundleSource python-mode
	" pytest : pytestの呼び出し
	NeoBundleLazy 'alfredodeza/pytest.vim'
	autocmd FileType python NeoBundleSource pytest.vim

	" verilog
	NeoBundleLazy 'vim-scripts/verilog.vim'
	autocmd FileType verilog NeoBundleSource verilog.vim

	" scheme
	NeoBundleLazy 'aharisu/vim_goshrepl'
	autocmd FileType scheme NeoBundleSource vim_goshrepl
" }}}


" ColorScheme {{{
	" colorscheme-hybrid : 目に優しいカラースキーマ
	NeoBundle "vim-scripts/twilight.git"
	NeoBundle "nanotech/jellybeans.vim.git"
	NeoBundle "vim-scripts/Wombat.git"
	NeoBundle 'w0ng/vim-hybrid'
" }}}


" Development {{{
	" learn-vimscript : VimScript文法ヘルプ :help learn-vimscript
	NeoBundleLazy 'mattn/learn-vimscript'
	" headlights : 読み込んだプラグイン毎のコマンドやキーマップ定義をMENU表示
	NeoBundleLazy 'vim-scripts/Headlights'
	" editvar : vimの変数を編集
	NeoBundleLazy 'thinca/vim-editvar'
	" prettyprint : vimの変数を整形して出力。editvar用
	NeoBundleLazy 'thinca/vim-prettyprint'
	" batch-source : 指定した範囲のVimScriptのコードを実行する
	NeoBundleLazy 'taku-o/vim-batch-source'
	" benchvimrc : vimrcのどこが重いのかを調べる
	" (vim --startuptime foo ではスクリプトファイル単位で読み込み時間を調べられる)
	NeoBundleLazy "mattn/benchvimrc-vim.git"
	" restart : vimを再起動
	NeoBundleLazy "tyru/restart.vim.git"
" }}}


function! LoadLazyPluginUtility()
	silent NeoBundleSource learn-vimscript
	silent NeoBundleSource Headlights
	silent NeoBundleSource vim-editvar
	silent NeoBundleSource vim-prettyprint
	silent NeoBundleSource vim-batch-source
	silent NeoBundleSource benchvimrc-vim
	silent NeoBundleSource restart.vim
endfunction
command! LoadLazyPluginUtility :call LoadLazyPluginUtility()


call neobundle#end()

NeoBundleCheck

