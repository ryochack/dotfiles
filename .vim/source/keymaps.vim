"==================================================
"   Key Mapping
"--------------------------------------------------
"         N I C V
"   map : o - - o
"   nmap: o - - -
"   imap: - o - -
"   cmap: - - o -
"   vmap: - - - o
"   lmap: - o o -    <- Insert,Command,Search(Text Input)
"   map!: - o o -
"         N I C V S
"   xmap: - - - o -  <- SelectModeはmouse選択(vmapはV+S)
"--------------------------------------------------
"   map A B  : Replace A with B
"   unmap A  : Remove A mapping
"   map      : Key Mappingの再帰を許可
"   noremap  : Key Mappingの再帰を禁止
"   mapclear : Remove All Mapping
"==================================================

" <Leader>は'\'
let mapleader = '\'

" Spaceは何もしない
nmap <silent> <Space> <Nop>
xmap <silent> <Space> <Nop>


" ----- Basic Mode ( map ) ------------------------
" {{{
noremap ; :
" 無名レジスタのコピー・ペースト
noremap gy "*y
noremap gp "*p
noremap gP "*P
" 複数候補がある場合に選択してからタグジャンプ
noremap <C-]> g<C-]>
" }}}


" ----- Normal Mode ( nmap ) ----------------------
" {{{
" Display行で移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" Return有効
nnoremap <CR> i<CR><ESC>
" 検索した後に移動しない設定
"nnoremap * *N
"nnoremap # #N
" ESC2回押しでハイライトを消す
nmap <ESC><ESC> :<C-u>nohlsearch<CR>
" 数字のデクリメント
nnoremap <C-j> <C-x>
" 数字のインクリメント
nnoremap <C-k> <C-a>
" EmacsKeyBind
noremap <C-a> <Home>
noremap <C-e> <End>
" Tab移動
noremap <silent> <C-F11> :<C-u>tabp<CR>
noremap <silent> <C-F12> :<C-u>tabn<CR>
" }}}


" ----- Insert Mode ( imap ) ----------------------
" {{{
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-h> <LEFT>
inoremap <C-l> <RIGHT>
inoremap <S-TAB> <C-i>
" Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-r>=InsertTabWrapper()<CR>
" }}}


" ----- Visual Mode ( vmap ) --
" {{{
" 選択範囲のインデントを連続して変更する
vnoremap < <gv
vnoremap > >gv
" ()[]までの選択を効率的にする
vnoremap ( t(
vnoremap ) t)
vnoremap [ t[
vnoremap ] t]
" }}}


" ----- Operator Pending Mode ( omap ) ------------
" {{{
" ()[]までの選択を効率的にする
onoremap ( t(
onoremap ) t)
onoremap [ t[
onoremap ] t]
" }}}


" ----- CommandLine Mode ( cmap ) -----------------
" {{{
cnoremap <C-x> <C-r>=expand("%:p:h")<CR>/
" }}}


" ----- Lang-Arg ( lmap ) -------------------------
" {{{
"lnoremap <TAB> <S-TAB>
" EmacsKeyBind
lnoremap <C-a> <Home>
lnoremap <C-e> <End>
" }}}



" ----- Plugins -------------------------

"# [ eregex.vim ] {{{
if isdirectory(expand('~/.vim/bundle/automatic/eregex.vim'))
	"# Rubyなどの正規表現で検索
	nnoremap <silent> ,/ :<C-u>M/
	nnoremap <silent> ,? :<C-u>M?
endif
" }}}

"# [ taglist.vim ] {{{
" Outline表示
if isdirectory(expand('~/.vim/bundle/automatic/taglist.vim'))
	nnoremap <F4> :<C-u>Tlist<CR>
endif
" }}}

"# [ gtags.vim ] {{{
" GNU Global カーソル下の使用箇所検索
if isdirectory(expand('~/.vim/bundle/automatic/gtags.vim'))
	nnoremap <F5> :<C-u>Gtags <C-r><C-w><CR>
	nnoremap <F6> :<C-u>Gtags -r <C-r><C-w><CR>
endif
" }}}

"# [ neocomplcache.vim ] {{{
" スニペット展開を実行する
if isdirectory(expand('~/.vim/bundle/automatic/neocomplcache'))
	imap <C-TAB> <Plug>(neocomplcache_snippets_expand)
	smap <C-TAB> <Plug>(neocomplcache_snippets_expand)
endif
" }}}

" [ visualstar.vim ] {{{
"# 検索した後に移動しない設定
if isdirectory(expand('~/.vim/bundle/automatic/visualstar.vim'))
	map *  <Plug>(visualstar-*)N
	map #  <Plug>(visualstar-#)N
	map g* <Plug>(visualstar-g*)N
	map g# <Plug>(visualstar-g#)N
endif
" }}}

" [ quickhl.vim ] {{{
"# Keywordのハイライト
if isdirectory(expand('~/.vim/bundle/automatic/vim-quickhl'))
	nmap <Space>m <Plug>(quickhl-toggle)
	xmap <Space>m <Plug>(quickhl-toggle)
	nmap <Space>M <Plug>(quickhl-reset)
	xmap <Space>M <Plug>(quickhl-reset)
	nmap <Space>j <Plug>(quickhl-match)
	xmap <Space>j <Plug>(quickhl-match)
endif
" }}}

" [ unite.vim ] {{{
" Unite.vim {{{
if isdirectory(expand('~/.vim/bundle/automatic/unite.vim'))
	nnoremap [unite] <Nop>
	nmap     ,u [unite]
	nnoremap <silent> [unite]*  :<C-u>Unite source -buffer-name=sources<CR>
	nnoremap <silent> [unite]f  :<C-u>Unite file file_mru -buffer-name=files<CR>
	nnoremap <silent> [unite]b  :<C-u>Unite buffer -buffer-name=buffers<CR>
	nnoremap <silent> [unite]"  :<C-u>Unite register -buffer-name=registers<CR>
	nnoremap <silent> [unite]c  :<C-u>Unite command -buffer-name=commands<CR>
	nnoremap <silent> [unite]hc :<C-u>Unite history/command -buffer-name=commands_history<CR>
	nnoremap <silent> [unite]hs :<C-u>Unite history/search -buffer-name=searchs_history<CR>
	nnoremap <silent> [unite]s  :<C-u>Unite snippet -buffer-name=snippets<CR>
	nnoremap <silent> [unite]t  :<C-u>Unite tab -buffer-name=tabs<CR>
	nnoremap <silent> [unite]o  :<C-u>Unite outline -buffer-name=outline<CR>
	nnoremap <silent> [unite]t  :<C-u>Unite tag -buffer-name=tags<CR>
	nnoremap <silent> [unite]l  :<C-u>Unite line -buffer-name=lines<CR>
	nnoremap <silent> [unite]r  :<C-u>Unite launch -buffer-name=launch<CR>
	nnoremap <silent> [unite]'  :<C-u>Unite mark -buffer-name=mark<CR>
	nnoremap <silent> [unite]m  :<C-u>Unite bookmark -buffer-name=bookmark<CR>
	nnoremap <silent> [unite]M  :<C-u>UniteBookmarkAdd<CR>
	nnoremap <silent> [unite]g  :<C-u>Unite grep -buffer-name=grep -no-quit<CR>
	nnoremap <silent> [unite]j  :<C-u>Unite jump -buffer-name=jumps<CR>
	nnoremap <silent> [unite]q  :<C-u>Unite qf -buffer-name=quickfix -no-quit<CR>
	nnoremap <silent> [unite]z  :<C-u>UniteResume
endif
" }}}

" [ Fugitive.vim ] {{{
" fugitive.vim {{{
if isdirectory(expand('~/.vim/bundle/automatic/vim-fugitive'))
	nnoremap [git] <Nop>
	nmap     ,g [git]
	nnoremap <silent> [git]s :<C-u>Gstatus<CR>
	nnoremap <silent> [git]l :<C-u>Glog<CR>
	" GitDiff:WorkingTree-HEAD
	nnoremap <silent> [git]d :<C-u>Gdiff HEAD<CR>
	nnoremap <silent> [git]a :<C-u>Gwrite<CR>
	nnoremap <silent> [git]c :<C-u>Gcommit<CR>
	nnoremap <silent> [git]C :<C-u>Git commit --amend<CR>
	nnoremap <silent> [git]b :<C-u>Gblame<CR>
endif
" }}}


