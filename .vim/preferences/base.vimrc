"**********************************************************
"     Basic
"**********************************************************
" バックスペースで何でも消せるようにする
set backspace=indent,eol,start
" スワップファイルを作成
set swapfile
set directory=~/.vim/temp/swapfile
" バックアップファイルを作成
" ファイル上書き時にバックアップ作成
set backup
set writebackup
set backupdir=~/.vim/temp/backupfile
" 編集中Fileを外部から変更されたら自動的に再読込
set autoread
augroup vimrc-checktime
	autocmd!
	autocmd WinEnter * checktime
augroup END
" 変更中でも保存せずに別ファイル表示を許可
set hidden
" 挿入モードでバックスペース拡張
set backspace=indent,eol,start
" テキスト整形オプション
set formatoptions=roqlm
" ビープ音を鳴らさない
set visualbell t_vb=
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


"**********************************************************
"     Search
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
"     Move
"**********************************************************
" 上下最低3行を残してスクロール
set scrolloff=3
" 左右最低3文字を残してスクロール
set sidescrolloff=3
" 矩形選択で自由に移動する
set virtualedit+=block


"**********************************************************
"     Edit
"**********************************************************
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

" 保存時に対象ディレクトリが存在しなければ作成する
augroup AutoMkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END


"**********************************************************
"     Complement
"**********************************************************
" 補完候補表示を有効
set wildmenu
" コマンドライン補完候補検索開始キー
set wildchar=<TAB>
" 補完動作設定:最長マッチ
set wildmode=list:longest
" コマンド・検索パターンの履歴数
set history=100
" 補完候補の検索場所
set complete=.,w,b,u,k,t,i
" 挿入モード補完設定
set completeopt=menu,menuone,preview


"**********************************************************
"     Encoding
"**********************************************************
" 改行文字
set fileformats=unix,dos,mac
" デフォルトエンコーディング
set encoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932


"**********************************************************
"     Appearance
"**********************************************************
" タイトル表示しない
set notitle
" 行間設定
set linespace=1
" CommandLineの行数
set cmdheight=1

" 対応する()を表示
set showmatch
" 行番号を表示しない
set nonumber
" 不可視文字表示
set list
" 不可視文字の表示形式設定
set listchars=tab:^\ ,trail:-,extends:@,eol:<
" 印字不可能文字を16進数で表示
set display=uhex

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カレント行ハイライト
set cursorline
" カレント列ハイライト
"set cursorcolumn
" カレントウィンドウのみに罫線を引く
augroup DrawLineAtCurrentWindow
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

" DiffでSpaceの数の違いを無視する
set diffopt=filler,iwhite

" ポップアップMENUの最大高さ設定
set pumheight=15


"**********************************************************
"     StatusLine
"**********************************************************
" plugin設定でPowerline有効にしている

" 常にステータスライン表示
set laststatus=2
" ステータスライン表示設定
function! GetEFstatus()
	let str = ''
	let fenc = ''
	if &fileformat == 'unix'
		let str = '[uni]'
	else
		let str = '[' . &fileformat . ']'
	endif
	if &fileencoding != ''
		if &fileencoding =~# 'iso-2022-jp'
			let fenc = 'J'
		elseif &fileencoding == 'utf-8'
			let fenc = 'U'
		elseif &fileencoding == 'cp932'
			let fenc = 'S'
		elseif &fileencoding =~# 'euc-jp'
			let fenc = 'E'
		else
			let fenc = &fileencoding
		endif
		let str = str . '[' . fenc . ']'
	else
		let str = str . '[-]'
	endif
	unlet fenc
	return str
endfunction
set statusline=\ %-f%-5(\ %r%m\ %)%=%{GetEFstatus()}\ %(%4c,\ %4l/%4L\ %)
" ステータスライン色設定
highlight StatusLine ctermfg=white ctermbg=red

" コマンドをステータスラインに表示
set showcmd

"自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin


"**********************************************************
"     Indent
"**********************************************************
" 新しい行を挿入時に自動インデント
set autoindent
" 新しい行を挿入時に高度な自動インデント
set smartindent

" 高度なTab挿入
set smarttab
" Tabの幅
set tabstop=4
" インデント幅
set shiftwidth=4
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set softtabstop=0
" TabをSpaceで置き換えない
set noexpandtab


"**********************************************************
"     Fold
"**********************************************************
" 折り畳み有効/無効
set nofoldenable

"----------------------------------
" 折り畳み対象設定 (foldmethod)
" manual  手動で折畳を定義する
" indent  インデントの数を折畳のレベル(深さ)とする
" expr    折畳を定義する式を指定する
" syntax  構文強調により折畳を定義する
" diff    変更されていないテキストを折畳対象とする
" marker  テキスト中の印で折畳を定義する
"----------------------------------
set foldmethod=manual
" 折り畳みカラム幅
set foldcolumn=2
" 折り畳むネストの最大値
set foldnestmax=3
" 折り畳み最小行数
set foldminlines=1
" FileOpen時は全ての折り畳みを展開
set foldlevel=100


"**********************************************************
"     Colors
"**********************************************************
"colorscheme pablo
set background=dark

set t_Co=256
"set t_Sf=[3%dm
"set t_Sb=[4%dm
" tmuxで背景色がおかしくなる対応
set t_ut=

" Tabと空白の色設定
highlight SpecialKey cterm=NONE ctermfg=DarkGray ctermbg=NONE guifg=Brown guibg=bg
" 行末の色設定
highlight NonText cterm=NONE ctermfg=DarkGray ctermbg=NONE guifg=Brown guibg=bg
" 行番号の色設定
highlight LineNr ctermfg=DarkGray
" カレント行の色設定。下線のみを引く。
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE

