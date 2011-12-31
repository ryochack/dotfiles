"==================================================
"   Vim の設定
"==================================================

highlight clear
syntax clear
mapclear
mapclear!


" vimを有効にする
set nocompatible


"===== Plugin管理 =====
" Vundle(Plugin)設定
if isdirectory(expand('~/.vim/bundle/vundle'))
	if filereadable(expand('~/.vim/source/bundles.vim'))
		source ~/.vim/source/bundles.vim
	endif
endif


"===== FileType Setting =====
if filereadable(expand('~/.vim/source/filetypes.vim'))
	source ~/.vim/source/filetypes.vim
endif


"===== KeyMapping Setteing =====
if filereadable(expand('~/.vim/source/keymaps.vim'))
	source ~/.vim/source/keymaps.vim
endif


"===== Color Config =====
" solarized設定に記述しているため、ここは無効化
" Syntax Highlight を有効
"syntax enable
" 256色を有効に
"set t_Co=256
"" Colorscheme設定は上書き防止で初めの方で設定する
"if isdirectory(expand('~/.vim/bundle/vim-colors-solarized'))
"	colorscheme solarized
"endif
"" 背景を設定
"set background=dark
"highlight Pmenu ctermbg=lightcyan
"highlight PmenuSel ctermbg=green
"highlight PmenuSbar ctermbg=darkgrey
"highlight PmenuThumb ctermbg=0



"===== Character Encoding =====
" 文字コードの自動認識
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
	" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd') 				
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置ずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif



"===== Character Display =====
" 現在のモードを表示
set showmode
" listの表示設定有効
set list
" Tabや行末を表示
set listchars=tab:^\ ,trail:-,extends:@,eol:<
" Tabと空白の色設定
"highlight SpecialKey cterm=NONE ctermfg=Black ctermbg=NONE guifg=Brown guibg=bg
" 行末の色設定
"highlight NonText cterm=NONE ctermfg=Black ctermbg=NONE guifg=Brown guibg=bg
" 行番号を表示
set number
highlight LineNr ctermfg=DarkGray
" 対応する()を表示
set showmatch
" カレント列ハイライト
"set cursorcolumn
" カレント行ハイライト
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE
" カレントウィンドウのみに罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
" タイトル表示しない
set notitle
" CommandLineの行数
set cmdheight=1
" 行間設定
set linespace=1

" --- Fold Config ---
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
set foldmethod=syntax
" 折り畳みカラム幅
set foldcolumn=2
" 折り畳むネストの最大値
set foldnestmax=2
" 折り畳み最小行数
set foldminlines=1
" FileOpen時は全ての折り畳みを展開
set foldlevel=100



"===== StatusLine Config =====
" 常にStatusLine表示
set laststatus=2
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
" StatusLine色設定
"highlight StatusLine ctermfg=white ctermbg=red
" CommandをStatusLineに表示
set showcmd



"===== Active Config =====
" 上下最低3行を残してスクロール
set scrolloff=3
" 左右最低3文字を残してスクロール
set sidescrolloff=3
" 挿入モードでBackSpace拡張
set backspace=indent,eol,start
" Free Cursor Modeにする (block:VisualMode, insert:InsertMode, all:AllMode)
set virtualedit=block
" Cursorを行頭・行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" --- Tab ---
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
" TabをSpaceで置き換える
set noexpandtab

" --- Search ---
" インクリメンタルサーチ有効
set incsearch
" 大文字小文字を区別しない
set ignorecase
" 小文字なら大文字と区別しない、大文字なら区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" 検索をループ
set nowrapscan

" --- grep ---
" 外部grep設定
set grepformat=%f:%l:%m,%f:%l:%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
"----------------------------------
" :grep {pattern} {file}                  /* command format */
" :grep searchword *.txt                  /* search in current directory */
" :grep -r searchword --include='*.txt'   /* recursive search */
"----------------------------------



"===== Utility =====
" Clipboard設定
" - unnamed:    無名レジスタに入るデータを*レジスタに入れる(ClipBoard共有)
"               unnamedをsetすると、BlockDiffが動作しなくなるので、とりあえずOFF
" - autoselect: VisualModeで選択したテキストがクリップボードに入るようにする(CUI版のみ) 
set clipboard+=autoselect
" DiffでSpaceの数の違いを無視する
set diffopt=filler,iwhite
" --- File ---
" SwapFileを作成しない
set noswapfile
" BackUpFileを作成しない
set nobackup
" File上書き時にBackUp作成
set nowritebackup
" 変更中でも保存せずに別ファイル表示を許可
set hidden
" 編集中Fileを外部から変更されたら自動的に再読込
set autoread
" makeのコンパイルエラーをQuickFixに取り込む
" filetype毎に設定するといいかも
"compiler $compiler_name でコンパイラ指定
"make でビルド実行



" === Complement Config ===
" 補完動作設定
set wildmode=list:longest
" 補完候補の検索場所
set complete=.,i
"set complete=.,w,b,u,k,t,i
" 挿入モード補完設定
set completeopt=menu,menuone,preview
" ポップアップMENUの最大高さ設定
set pumheight=10
" プレビューウィンドウの最大高さ設定
"set previewheight=12
" 補完候補表示を有効
set wildmenu
" 候補検索開始キー
set wildchar=<TAB>
" -- replace "C-x C-o" to TAB
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<TAB>"
	else
		if pumvisible()
		return "\<C-N>"
		else
			return "\<C-N>\<C-P>"
		end
	endif
endfunction
" }}} Autocompletion using the TAB key


"===== Command Define =====
"----------------------------------
" command A B  : Make A Command. Action B
" command! A B : Redefine A Command.
" delcommand A : Remove A Command Define.
" comclear     : All Clear User Command.
"----------------------------------
" CdCurrentコマンドでカレントファイルのディレクトリに移動
command! CdCurrent :cd %:p:h
" QuickFix表示時に編集可能にする(Enterで飛べるようにする)
command! CC :cclose
function! COpenCustom()
	copen
	set modifiable
	set nowrap
endfunction
command! CO :call COpenCustom()


