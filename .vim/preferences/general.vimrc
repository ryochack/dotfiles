"**********************************************************
"     基本設定 Basics
"**********************************************************
" バックスペースで何でも消せるようにする
set backspace=indent,eol,start
" スワップファイルを作成しない
set noswapfile
" バックアップファイルを作成しない
set nobackup
" ファイル上書き時にバックアップ作成しない
set nowritebackup
" 編集中Fileを外部から変更されたら自動的に再読込
set autoread
" 変更中でも保存せずに別ファイル表示を許可
set hidden
" 挿入モードでバックスペース拡張
set backspace=indent,eol,start
" テキスト整形オプション
set formatoptions=roqlm
" ビープ音を鳴らさない
set vb t_vb=
" Explorerの初期ディレクトリ(:browse)
set browsedir=buffer
" カーソルを行頭・行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" コマンドをステータスラインに表示
set showcmd
" 現在のモードを表示
set showmode
" viminfoファイル設定
set viminfo='50,<1000,s100,/100,n~/.vim/temp/viminfo
" モードライン無効
set modelines=0

" クリップモード設定
" - unnamed:    無名レジスタに入るデータを*レジスタに入れる(ClipBoard共有)
"               unnamedをsetすると、BlockDiffが動作しなくなるので、とりあえずOFF
" - autoselect: VisualModeで選択したテキストがクリップボードに入るようにする(CUI版のみ)
set clipboard+=autoselect

" マウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" キーマップリーダー
let mapleader = '\'
noremap ; :
" Spaceは何もしない
nmap <silent> <Space> <Nop>
xmap <silent> <Space> <Nop>
nmap <silent> <C-a> <Nop>
xmap <silent> <C-a> <Nop>
nmap <silent> <C-e> <Nop>
xmap <silent> <C-e> <Nop>

" ファイルタイプ判定をon
filetype plugin on


"**********************************************************
"     Tags設定 Tags
"**********************************************************
" 複数候補がある場合に選択してからタグジャンプ
noremap <C-]> g<C-]>


"**********************************************************
"     検索設定 Search
"**********************************************************
" 検索をループしない
set nowrapscan
" 大文字小文字を区別しない
set ignorecase
" 小文字なら大文字と区別しない、大文字なら区別する
set smartcase
" インクリメンタルサーチ有効
set incsearch
" 検索結果をハイライト
set hlsearch
" ESC2回押しでハイライトを消す
nmap <ESC><ESC> :<C-u>nohlsearch<CR>

" カーソル下のキーワードをヘルプでひく
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>

" --- grep ---
" 外部grep設定
set grepformat=%f:%l:%m,%f:%l:%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
"----------------------------------
" :grep {pattern} {file}                  /* command format */
" :grep searchword *.txt                  /* search in current directory */
" :grep -r searchword --include='*.txt'   /* recursive search */
"----------------------------------


"**********************************************************
"     移動設定 Move
"**********************************************************
" 上下最低3行を残してスクロール
set scrolloff=3
" 左右最低3文字を残してスクロール
set sidescrolloff=3
" 矩形選択で自由に移動する
set virtualedit+=block

" Display行移動
nnoremap j gj
nnoremap k gk
" 論理行移動
nnoremap gj j
nnoremap gk k

" EmacsKeyBind
noremap <C-a> <Home>
noremap <C-e> <End>
lnoremap <C-a> <Home>
lnoremap <C-e> <End>


"**********************************************************
"     QuickFix設定
"**********************************************************
" QuickFixをq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" QuickFixリストからEnterで飛ぶ
autocmd FileType qf nnoremap <buffer> <CR> :.cc<CR>


