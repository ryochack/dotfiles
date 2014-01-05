"**********************************************************
"     表示設定 Appearance
"**********************************************************
" タイトル表示しない
set notitle
" 行間設定
set linespace=1
" CommandLineの行数
set cmdheight=1

" 対応する()を表示
set showmatch
" 行番号を表示
set number
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
"     ステータスライン StatusLine
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
"set statusline=\ %-f%-5(\ %r%m\ %)%=%{GetEFstatus()}\ %(%4c,\ %4l/%4L\ %)
" ステータスライン色設定
"highlight StatusLine ctermfg=white ctermbg=red

" コマンドをステータスラインに表示
set showcmd

"自動的に QuickFix リストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin


"**********************************************************
"     インデント設定 Indent
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

"if has("autocmd")
"	"ファイルタイプの検索を有効にする
"	filetype plugin on
"	"そのファイルタイプにあわせたインデントを利用する
"	filetype indent on
"	" これらのftではインデントを無効に
"	"autocmd FileType php filetype indent off
"
"	autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType go         setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType verilog    setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
"endif


"**********************************************************
"     折り畳み Fold
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
"     色設定 Colors
"**********************************************************
" ハイライト on
syntax enable

colorscheme hybrid
set background=dark

set t_Co=256
"set t_Sf=[3%dm
"set t_Sb=[4%dm

" Tabと空白の色設定
highlight SpecialKey cterm=NONE ctermfg=DarkRed ctermbg=NONE guifg=Brown guibg=bg
" 行末の色設定
highlight NonText cterm=NONE ctermfg=DarkRed ctermbg=NONE guifg=Brown guibg=bg
" 行番号の色設定
highlight LineNr ctermfg=DarkGray
" カレント行の色設定。下線のみを引く。
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE

