"**********************************************************
"     Plugin管理 ( NeoBundle )
"**********************************************************

filetype off
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
endif

" Git Protocol
let g:neobundle_default_git_protocol='git'

" Bundle {{{
	NeoBundle 'Shougo/neobundle.vim.git'
" }}}


" Edit {{{
	" qfreplace : QuickFixの内容を編集
	NeoBundle 'thinca/vim-qfreplace.git'
	" alignta : マルチバイト文字対応Align
	NeoBundle 'h1mesuke/vim-alignta.git'
	" Tabular : フィルタリングと整形
	NeoBundle 'godlygeek/tabular.git'
	" YankRing : Yank履歴を使用する
	NeoBundle 'vim-scripts/YankRing.vim.git'
	" gundo : undo履歴を便利に追えるようにする
	NeoBundle 'sjl/gundo.vim.git'
	" sequence : 連番を振るのを楽にする
	NeoBundle 'kurkale6ka/vim-sequence.git'
	" surround : テキストオブジェクトに対する括弧編集
	NeoBundle 'tpope/vim-surround.git'
	" commentary : コメントアウト (gc[c])
	NeoBundle 'tpope/vim-commentary.git'

	" operator-user : 簡単にoperatorを定義できるようにする
	NeoBundle 'kana/vim-operator-user.git'
	" operator-replace : Yankしたもので選択範囲を置換する
	NeoBundle 'kana/vim-operator-replace.git'
	" operator-sort : 選択範囲をソートする
	NeoBundle 'emonkak/vim-operator-sort.git'
	" operator-camelize : 選択範囲をCamelCaseやsnake_caseに変換する
	NeoBundle 'tyru/operator-camelize.vim.git'

	" textobj-user : 簡単にテキストオブジェクトを作れる
	NeoBundle 'kana/vim-textobj-user.git'
	" textobj-indent : インデントされたものをtext-object化
	NeoBundle 'kana/vim-textobj-indent.git'
	" textobj-syntax : シンタックスで定義されたものをtext-object化
	NeoBundle 'kana/vim-textobj-syntax.git'
	" textobj-function : 関数の中身をtext-object化
	NeoBundle 'kana/vim-textobj-function.git'
	" textobj-fold : 折り畳みをtext-object化
	"NeoBundle 'kana/vim-textobj-fold.git'
	" textobj-entire : バッファ全体をtext-object化
	NeoBundle 'kana/vim-textobj-entire.git'
	" textobj-line : 行をtext-object化
	NeoBundle 'kana/vim-textobj-line.git'
	" textobj-jabraces : 「foo」や【bar】などをtext-object化
	NeoBundle 'kana/vim-textobj-jabraces.git'
	" textobj-comment : コメントをtext-object化
	NeoBundle 'thinca/vim-textobj-comment.git'
	" textobj-comment : 任意の区切り文字の間をtext-object化
	NeoBundle 'thinca/vim-textobj-between.git'
	" textobj-wiw : wordの中の単語をtext-object化
	NeoBundle 'h1mesuke/textobj-wiw.git'

	" fitpaste : 整形して貼り付け
	NeoBundle 'ryochack/fitpaste-vim.git'
" }}}


" Complement {{{
	" neocomplcache : 補完プラグイン
	NeoBundle 'Shougo/neocomplcache.git'
	" neosnippet : スニペット補完
	NeoBundle 'Shougo/neosnippet.git'
	" snipmate-snippets : スニペット集
	NeoBundle 'honza/snipmate-snippets'
" }}}


" Read {{{
	" taglist : コード上のメソッド・変数一覧を表示
	NeoBundle 'vim-scripts/taglist.vim.git'
	" gtags : GNU Globalを使って関数の定義・使用箇所にジャンプ
	NeoBundle 'vim-scripts/gtags.vim.git'
	" BlockDiff : 選択部分の比較
	NeoBundle 'ryochack/BlockDiff.git'
	" quickhl : 複数ハイライト
	NeoBundle 't9md/vim-quickhl.git'
" }}}


" Move {{{
	" easymotion : 単語移動を楽にする
	NeoBundle 'Lokaltog/vim-easymotion.git'
	" matchit : 「%」による対応括弧へのカーソル移動機能の拡張
	NeoBundle 'tsaleh/vim-matchit.git'
	" smartword : 単語移動を拡張
	NeoBundle 'kana/vim-smartword.git'
	" wokmarks : markの拡張。自動でmarkを振る,移動,リスト表示,削除を行う
	NeoBundle 'vim-scripts/wokmarks.vim.git'
	" poslist : <C-o>,<C-i>拡張。同じ行内での移動に対応
	NeoBundle 'thinca/vim-poslist.git'
" }}}


" Search {{{
	" visualstar : VisualMode選択されているTextを検索
	NeoBundle 'thinca/vim-visualstar.git'
	" eregex : Perl/Rubyの正規表現を使う
	NeoBundle 'othree/eregex.vim.git'
	" grep : 外部grep使用
	NeoBundle 'vim-scripts/grep.vim.git'
	" ack : ackを使って検索。:Ack [options] {pattern} [{directory}]
	"NeoBundle 'mileszs/ack.vim.git'
	" ag : agを使って検索。:Ag [options] {pattern} [{directory}]
	NeoBundle 'rking/ag.vim.git'
	" cmigemo : Migemo検索ができるようにする
	NeoBundle 'cmigemo', {'type':'nosync','base':'~/.vim/bundle'}
" }}}


" Explorer {{{
	" bufexplorer : 開いているバッファ一覧を表示
	NeoBundle 'vim-scripts/bufexplorer.zip.git'
	" DumbBuf : quickbufっぽくバッファを管理
	NeoBundle 'tyru/DumbBuf.vim.git'
	" vimfiler : 高機能ファイラ
	NeoBundle 'Shougo/vimfiler.git'
	" DirDiff : ディレクトリの差分を表示。"diff"必要
	NeoBundle 'vim-scripts/DirDiff.vim.git'
" }}}


" Encoding {{{
	" recognize_charcode : 文字化け解消プラグイン
	NeoBundle 'banyan/recognize_charcode.vim.git'
" }}}


" Web {{{
	" webapi : vim Interface to Web API (gistで必要)
	NeoBundle 'mattn/webapi-vim.git'
	" open-browser : カーソル下のURLを開くor単語を検索エンジンで検索
	NeoBundleLazy 'tyru/open-browser.vim.git'
" }}}


" Utility {{{
	" vimproc : vimから非同期実行
	NeoBundle 'Shougo/vimproc.git', {
	      \ 'build' : {
	      \     'windows' : 'make -f make_mingw32.mak',
	      \     'cygwin' : 'make -f make_cygwin.mak',
	      \     'mac' : 'make -f make_mac.mak',
	      \     'unix' : 'make -f make_unix.mak',
	      \    },
	      \ }
	" quickrun : 編集中のファイルを簡単に実行
	NeoBundle 'thinca/vim-quickrun.git'
	" ref : リファレンスをvimで見る
	NeoBundle 'thinca/vim-ref.git'
	" vinarizse : バイナリエディタ
	NeoBundle 'Shougo/vinarise.git'
	" 数値を2進数,8進数,10進数,16進数で表示
	NeoBundle 'vim-scripts/ShowMultiBase.git'
	" altercmd : デフォルトで定義されているコマンドをユーザ定義コマンドと置き換える
	NeoBundle 'tyru/vim-altercmd.git'
	" cecutil : 他のプラグインのためのutility
	NeoBundle 'vim-scripts/cecutil.git'
	" openbuf : バッファ管理ライブラリ
	NeoBundle 'thinca/vim-openbuf.git'
	" vimdoc-ja : vim日本語ドキュメント
	NeoBundle 'vim-jp/vimdoc-ja.git'
	" lightline : リッチなステータスラインにする
	NeoBundle 'itchyny/lightline.vim.git'

	" junkfile : 一時ファイル作成
	NeoBundle 'junkfile', {'type':'nosync','base':'~/.vim/bundle'}
" }}}


" Unite {{{
	" unite.vim : 全てを破壊し、全てを繋ぐ
	NeoBundle 'Shougo/unite.vim.git'
	" unite-help : ヘルプを検索
	NeoBundle 'tsukkee/unite-help.git'
	" unite-tag : タグファイルを検索
	NeoBundle 'tsukkee/unite-tag.git'
	" unite-gtag : Gtagsの情報をUnite化
	NeoBundle 'daisuzu/unite-gtags.git'
	" unite-outline : アウトラインを表示
	NeoBundle 'h1mesuke/unite-outline.git'
	" unite-mark : markをUnite化
	NeoBundle 'tacroe/unite-mark.git'
	" unite-history : VimのヒストリをUniteで実行
	NeoBundle 'thinca/vim-unite-history.git'
	" unite-qf : QuickFixの内容をUnite化
	NeoBundle 'sgur/unite-qf.git'
	" unite-launch : 外部コマンドをquickrunで実行
	NeoBundle 'ujihisa/unite-launch.git'
	" unite-ack : Uniteでack検索
	NeoBundle 't9md/vim-unite-ack.git'
	" unite-quicklean : quickrunのプラグイン。中間言語の勉強用。C言語で使うとアセンブラを出力してくれる。
	NeoBundle 'ujihisa/quicklearn.git'
	" unite-build : 非同期でmakeし、ビルド結果をUnite化
	NeoBundle 'Shougo/unite-build.git'
	" unite-scriptnames : 読み込んだプラグインをUniteから探す
	NeoBundle 'zhaocai/unite-scriptnames.git'
	" unite-svn : UniteからSVNを使う
	NeoBundle 'kmnk/vim-unite-svn.git'
" }}}


" CtrlP {{{
	" ctrlp : 正規表現を使ったファイル検索など
	NeoBundle 'kien/ctrlp.vim.git'
" }}}


" Git {{{
	" fugitive : VimからGitを使う
	NeoBundle 'tpope/vim-fugitive.git'
	" gist : VimからGistを使う
	NeoBundle 'mattn/gist-vim.git'
" }}}


" FileType {{{
	" python-mode : Python設定。docの呼び出し,補完,文法チェック,リファクタリング,Scriptの実行
	NeoBundleLazy 'klen/python-mode.git'
	autocmd FileType python NeoBundleSource python-mode
	" pytest : pytestの呼び出し
	NeoBundleLazy 'alfredodeza/pytest.vim.git'
	autocmd FileType python NeoBundleSource pytest.vim
	" golang : Go言語のシンタックス・インデントを適用
	NeoBundleLazy 'golang', {'type':'nosync','base':'~/.vim/bundle'}
	autocmd FileType go NeoBundleSource golang
	" golint : Go言語のLint
	NeoBundleLazy 'golint', {'type':'nosync','base':'~/.vim/bundle'}
	autocmd FileType go NeoBundleSource golint
	" gocode : Go言語補完 <C-X><C-O>で展開
	NeoBundleLazy 'gocode', {'type':'nosync','base':'~/.vim/bundle'}
	autocmd FileType go NeoBundleSource gocode
	" rsense : Rubyに特化したomni補完
	NeoBundleLazy 'taichouchou2/vim-rsense'
	autocmd FileType ruby NeoBundleSource vim-rsense
	" verilog
	NeoBundleLazy 'vim-scripts/verilog.vim.git'
	autocmd FileType verilog NeoBundleSource verilog.vim
" }}}


" ColorScheme {{{
	" colorscheme-solarized : 目に優しいカラースキーマ
	NeoBundle 'altercation/vim-colors-solarized.git'
" }}}


" Development {{{
	" learn-vimscript : VimScript文法ヘルプ :help learn-vimscript
	NeoBundleLazy 'mattn/learn-vimscript.git'
	" headlights : 読み込んだプラグイン毎のコマンドやキーマップ定義をMENU表示
	NeoBundleLazy 'vim-scripts/Headlights.git'
	" editvar : vimの変数を編集
	NeoBundleLazy 'thinca/vim-editvar.git'
	" prettyprint : vimの変数を整形して出力。editvar用
	NeoBundleLazy 'thinca/vim-prettyprint.git'
	" batch-source : 指定した範囲のVimScriptのコードを実行する
	NeoBundleLazy 'taku-o/vim-batch-source.git'
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


filetype plugin indent on

