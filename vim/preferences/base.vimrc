" default encoding
set encoding=utf-8
" this file encoding
scriptencoding utf-8

"=========
"  Basic
"=========
" Set targets that can be erased with BackSpace
set backspace=indent,eol,start
" Create swapfiles
set swapfile
set directory=~/.vim/temp/swapfile
" Create backup files, and Create it when overwriting files
set backup
set writebackup
set backupdir=~/.vim/temp/backupfile
" Auto-Read when updated from outside
set autoread
augroup vimrc-checktime
	autocmd!
	autocmd WinEnter * checktime
augroup END
" Allow showing other files without saving
set hidden
" Text format option
set formatoptions=roqlm
" Don't beep
set visualbell t_vb=
" Default directory for Explorer (:browse)
set browsedir=buffer
" Ensure that the cursor does not stop at the beginning or end of a line
set whichwrap=b,s,h,l,<,>,[,]
" Show current mode
set showmode
" viminfo file setting
set viminfo='50,<1000,s100,/100,n~/.vim/temp/viminfo
" Disable mode lines
set modelines=0

" Clip mode setting
" - unnamed:    data to be put into the unnamed register is also put into
"               the * register (sharing clipboard)
"               (If this value is set, BlockDiff will not work)
" - autoselect: The text selected on Visual mode goes into the clipboard.
set clipboard+=autoselect

" Use mouse
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" Enable wrapping
set wrap
" Break lines so that words are not broken
set linebreak
" Enable indent for wrapped lines
set breakindent
set breakindentopt=min:20,shift:0
set showbreak=+\ 

"==========
"  Search
"==========
" Don't loop search
set nowrapscan

set ignorecase
set smartcase
set incsearch
set hlsearch

" --- grep ---
" External grep setting
set grepformat=%f:%l:%m,%f:%l:%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
"----------------------------------
" :grep {pattern} {file}                  /* command format */
" :grep searchword *.txt                  /* search in current directory */
" :grep -r searchword --include='*.txt'   /* recursive search */
"----------------------------------

"========
"  Move
"========
" Leave at least 3 lines up and down when scroling
set scrolloff=3
" Leave at least 3 chars left and right when scroling
set sidescrolloff=3
" Move freely when rectangle selecting
set virtualedit+=block

"========
"  Edit
"========
" Turn off IME when exiting insert mode
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline

" Auto create target directory if it is not exists
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

"==============
"  Complement
"==============
" Display complemention list
set wildmenu
" Command line complemention candidate search start key
set wildchar=<TAB>
" Complemention setting: longest match
set wildmode=list:longest
" History size of commands and search patterns
set history=100
" Search locatoin of complemention candidates
set complete=.,w,b,u,k,t,i
" Complementions setting on insert mode
set completeopt=menu,menuone,preview

"============
"  Encoding
"============
" Newline caracter
set fileformats=unix,dos,mac

" Low priority extensions when displaying wildcards
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Forces a file to open in the specified character set
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

"==============
"  Appearance
"==============
" Don't show title
set notitle

set linespace=1
" Line size of CommandLine
set cmdheight=1

set showmatch
set nonumber
" Display unvisible character
set list
" Display format for unvisible characters
" set ambiwidth=single
set listchars=tab:^\ ,trail:-,extends:@,eol:<
" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:-,eol:↲
" set listchars=tab:»-,extends:›,precedes:‹,nbsp:·,trail:-,eol:↲
" Display unprintable characters in hexadecimal.
set display=uhex

" Display ZenkakuSpace
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

set cursorline
augroup DrawLineAtCurrentWindow
	autocmd!
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END

" Ignore white spaces on Diff
set diffopt=filler,iwhite

" Max height of popup menu
set pumheight=15

"==============
"  StatusLine
"==============
" Display status line always
set laststatus=2
" Status line display setting
function! GetEFstatus()
	let str = ''
	let fenc = ''
	if &fileformat ==# 'unix'
		let str = '[uni]'
	else
		let str = '[' . &fileformat . ']'
	endif
	if &fileencoding !=# ''
		if &fileencoding =~# 'iso-2022-jp'
			let fenc = 'J'
		elseif &fileencoding ==# 'utf-8'
			let fenc = 'U'
		elseif &fileencoding ==# 'cp932'
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
" Status line color setting
highlight StatusLine ctermfg=white ctermbg=red

" Show command on status line
set showcmd

" Show QuickFix list automatically
augroup AutoQuickFixList
	autocmd!
	autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin
	autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd lwin
augroup END

"==========
"  Indent
"==========
" Auto indent new line when inserting
set autoindent
" Auto smart indent new line when inserting
set smartindent

set smarttab
" Width of tab
set tabstop=4
" Width of indent
set shiftwidth=4
" Number of spaces by pushing Tab key. 0 means same as tabstop.
set softtabstop=0
" Replace tabs with spaces
set expandtab

"========
"  Fold
"========
" Folding setting
set nofoldenable

"----------------------------------
" Folding methods
"   manual  Define the folding manualy
"   indent  The number of indent should be at the level of the fold
"   expr    Specify expression that defines the folding
"   syntax  Define the folding by syntax
"   diff    Make unchanged text the target of fold
"   marker  Define the folding by markers in text
"----------------------------------
set foldmethod=manual
" Folding column width
set foldcolumn=2
" Folding max nest
set foldnestmax=3
" Folding min lines
set foldminlines=1
" Expand all foldings when opening file
set foldlevel=100

"==========
"  Colors
"==========
"colorscheme pablo
set background=dark

set t_Co=256
"set t_Sf=[3%dm
"set t_Sb=[4%dm
" Workaound: Problem with backgound color going wrong on tmux
set t_ut=

" Color setting of Tab and space
highlight SpecialKey cterm=NONE ctermfg=DarkGray ctermbg=NONE guifg=Brown guibg=bg
" Color setting of end line
highlight NonText cterm=NONE ctermfg=DarkGray ctermbg=NONE guifg=Brown guibg=bg
" Color setting of line number
highlight LineNr ctermfg=DarkGray
" Color setting of current line. Draw underline only.
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=Black gui=underline guifg=NONE guibg=NONE

