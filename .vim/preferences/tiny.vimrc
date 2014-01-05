"**********************************************************
"     最小設定
"**********************************************************
filetype off
filetype plugin indent off

"----------[ Basics ]----------
set showcmd
set hidden
set vb t_vb=
noremap ; :

"----------[ Appearance ]----------
set notitle
set showmatch
set number
set list
set listchars=tab:^\ ,trail:-,extends:@,eol:<

"----------[ Colors ]----------
set wildmenu
set wildchar=<TAB>
set wildmode=list:longest
set history=1000
set complete=.,w,b,u,k,t,i
set completeopt=menu,menuone,preview

"----------[ Colors ]----------
set background=dark
set t_Co=256

"----------[ Edit ]----------
nnoremap <CR> i<CR><ESC>
cnoremap <C-x> <C-r>=expand("%:p:h")<CR>/
autocmd BufWritePre * :%s/\s\+$//ge

"----------[ Encoding ]----------
set fileformats=unix,dos,mac
set encoding=utf-8

"----------[ Fold ]----------
set nofoldenable

"----------[ Indent ]----------
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab

"----------[ Search ]----------
set nowrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <ESC><ESC> :<C-u>nohlsearch<CR>
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>

"----------[ Move ]----------
set virtualedit+=block
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"noremap <C-a> <Home>
"noremap <C-e> <End>
"lnoremap <C-a> <Home>
"lnoremap <C-e> <End>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

filetype plugin indent on
syntax enable

