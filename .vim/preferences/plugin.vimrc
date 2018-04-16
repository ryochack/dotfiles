"**********************************************************
"     Plugin管理 ( vim-plug )
"**********************************************************

if has('vim_starting')
	set runtimepath+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
	end
endif


call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

" Text Object {
	" textobj-user : 簡単にテキストオブジェクトを作れる
	Plug 'kana/vim-textobj-user'
	" textobj-indent : インデントされたものをtext-object化
	Plug 'kana/vim-textobj-indent'
	" textobj-syntax : シンタックスで定義されたものをtext-object化
	Plug 'kana/vim-textobj-syntax'
	" textobj-function : 関数の中身をtext-object化
	Plug 'kana/vim-textobj-function'
	" textobj-fold : 折り畳みをtext-object化
	Plug 'kana/vim-textobj-fold'
	" textobj-entire : バッファ全体をtext-object化
	Plug 'kana/vim-textobj-entire'
	" textobj-line : 行をtext-object化
	Plug 'kana/vim-textobj-line'
	" textobj-jabraces : 「foo」や【bar】などのブレースをtext-object化
	Plug 'kana/vim-textobj-jabraces'
	" textobj-comment : コメントをtext-object化
	Plug 'thinca/vim-textobj-comment'
	" textobj-between : 任意の区切り文字の間をtext-object化
	Plug 'thinca/vim-textobj-between'
	" textobj-wiw : wordの中の単語をtext-object化
	Plug 'h1mesuke/textobj-wiw'
" }

" Operator {
	" operator-user : 簡単にoperatorを定義できるようにする
	Plug 'kana/vim-operator-user'
	" operator-replace : Yankしたもので選択範囲を置換する
	Plug 'kana/vim-operator-replace'
	" surround : テキストオブジェクトに対する括弧編集
	Plug 'tpope/vim-surround'
" }

" Edit {
	" qfreplace : QuickFixの内容を編集
	Plug 'thinca/vim-qfreplace'
	" alignta : マルチバイト文字対応Align
	Plug 'h1mesuke/vim-alignta'
	" yankround : Yank履歴を使用する
	Plug 'LeafCage/yankround.vim'
	" gundo : undo履歴を便利に追えるようにする
	" Plug 'sjl/gundo.vim'
	" commentary : コメントアウト (gc[c])
	Plug 'tpope/vim-commentary'
	" fitpaste : 整形して貼り付け
	Plug 'ryochack/fitpaste-vim'
" }

" Complement {
	" neocomplete : 補完プラグイン
	Plug 'Shougo/neocomplete'
	" neosnippet : スニペット補完
	"Plug 'Shougo/neosnippet'
	" neosnippet-snippets : スニペット集
	"Plug 'Shougo/neosnippet-snippets'
" }

" Display {
	" tagbar : ctagsから関数などの定義情報を表示
	Plug 'majutsushi/tagbar'
	" gtags : GNU Globalを使って関数の定義・使用箇所にジャンプ
	Plug 'vim-scripts/gtags.vim'
	" BlockDiff : 選択部分の比較
	Plug 'ryochack/BlockDiff'
	" quickhl : 複数ハイライト
	Plug 't9md/vim-quickhl'
" }

" Move {
	" visualstar : VisualMode中に*,#で選択されているTextを検索
	Plug 'thinca/vim-visualstar'
" }

" Filer {
	" dirvish : 小さく高速なファイラ
	Plug 'justinmk/vim-dirvish'
	" NerdTree : ツリー型ファイラ
	Plug 'scrooloose/nerdtree'
" }

" Encoding {
	" recognize_charcode : 文字化け解消プラグイン
	Plug 'banyan/recognize_charcode.vim'
" }

" Utility {
	" localrc : 各ディレクトリのlocal vimrcファイルを置けるようにする
	Plug 'thinca/vim-localrc'
	" quickrun : 編集中のファイルを簡単に実行
	Plug 'thinca/vim-quickrun'
	" vinarise : バイナリエディタ
	"Plug 'Shougo/vinarise'
	" vimdoc-ja : vim日本語ドキュメント
	Plug 'vim-jp/vimdoc-ja'
	" lightline : リッチなステータスラインにする
	Plug 'itchyny/lightline.vim'
	" junkfile : 一時ファイル作成
	Plug 'Shougo/junkfile.vim'
	" vimproc : vimから非同期実行
	Plug 'Shougo/vimproc', { 'do': 'make' }
		" 'windows' : 'tools\\update-dll-mingw'
		" 'cygwin' : 'make -f make_cygwin.mak'
		" 'mac' : 'make -f make_mac.mak'
		" 'linux' : 'make'
		" 'unix' : 'gmake'
	" webapi : vim Interface to Web API (gistで必要)
	Plug 'mattn/webapi-vim'
	" open-browser : カーソル下のURLを開くor単語を検索エンジンで検索
	" Plug 'tyru/open-browser.vim'
	" cecutil : 他のプラグインのためのutility
	Plug 'vim-scripts/cecutil'
	" w3m : console web browser W3M
	Plug 'yuratomo/w3m.vim'
	" investigate.vim : Document browser Zeal(Linux), Dash(Mac), Velocity(Windows)
	Plug 'keith/investigate.vim'
" }

" CtrlP {
	" ctrlp : 正規表現を使ったファイル検索など
	Plug 'kien/ctrlp.vim'
" }

" Git {
	" fugitive : VimからGitを使う
	Plug 'tpope/vim-fugitive'
	" gist : VimからGistを使う
	Plug 'mattn/gist-vim'
" }

" FileType {
	" vim-go : Go development plugin for Vim
	Plug 'fatih/vim-go', { 'for': 'go' }
	" python-mode : Python設定。docの呼び出し,補完,文法チェック,リファクタリング,Scriptの実行
	" Plug 'klen/python-mode', { 'for': 'python' }
	" pytest : pytestの呼び出し
	" Plug 'alfredodeza/pytest.vim', { 'for': 'python' }
	" verilog
	Plug 'vim-scripts/verilog.vim', { 'for': 'verilog' }
	" scheme
	Plug 'aharisu/vim_goshrepl', { 'for' : 'scheme' }
	" rust
	Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
	Plug 'racer-rust/vim-racer', { 'for' : 'rust' }
	Plug 'rhysd/rust-doc.vim', { 'for' : 'rust' }
	" cmake
	Plug 'richq/vim-cmake-completion', { 'for' : 'cmake' }
	Plug 'vhdirk/vim-cmake', { 'for' : 'cmake' }
	Plug 'shime/vim-livedown', { 'for' : 'markdown' }
	" language server
	Plug 'prabirshrestha/async.vim', { 'for' : 'rust' }
	Plug 'prabirshrestha/vim-lsp', { 'for' : 'rust' }
" }

" ColorScheme {
	" colorscheme-hybrid : 目に優しいカラースキーマ
	Plug 'vim-scripts/twilight'
	Plug 'nanotech/jellybeans.vim'
	Plug 'vim-scripts/Wombat'
	Plug 'w0ng/vim-hybrid'
" }

" Vim-Development {
	" learn-vimscript : VimScript文法ヘルプ :help learn-vimscript
	Plug 'mattn/learn-vimscript', { 'on': 'VimDev' }
	" headlights : 読み込んだプラグイン毎のコマンドやキーマップ定義をMENU表示
	Plug 'vim-scripts/Headlights', { 'on': 'VimDev' }
	" editvar : vimの変数を編集
	Plug 'thinca/vim-editvar', { 'on': 'VimDev' }
	" prettyprint : vimの変数を整形して出力。editvar用
	Plug 'thinca/vim-prettyprint', { 'on': 'VimDev' }
	" batch-source : 指定した範囲のVimScriptのコードを実行する
	Plug 'taku-o/vim-batch-source', { 'on': 'VimDev' }
	" benchvimrc : vimrcのどこが重いのかを調べる
	" (vim --startuptime foo ではスクリプトファイル単位で読み込み時間を調べられる)
	Plug 'mattn/benchvimrc-vim', { 'on': 'VimDev' }
	" restart : vimを再起動
	Plug 'tyru/restart.vim', { 'on': 'VimDev' }
" }

call plug#end()

