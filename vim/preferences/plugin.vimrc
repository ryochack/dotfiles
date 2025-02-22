" this file encoding
scriptencoding utf-8

"======================
"  Plugin managements
"======================

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
	" surround: edit 'surroundings'
	Plug 'tpope/vim-surround'
" }

" Operator {
	" operator-user: define user operator easily
	Plug 'kana/vim-operator-user'
	" operator-replace: replace selected text with yanked contents (needs operator-user)
	Plug 'kana/vim-operator-replace'
" }

" Edit {
	" qfreplace: replace contents on quickfix
	Plug 'thinca/vim-qfreplace'
	" qfedit: edit quickfix list
	Plug 'itchyny/vim-qfedit'
	" vim-easy-align: easy alignment
	Plug 'junegunn/vim-easy-align'
	" commentary: comment out (gc[c])
	Plug 'tpope/vim-commentary'
	" fitpaste: format and paste
	Plug 'ryochack/fitpaste-vim'
" }

" Tag {
	" tagbar: a class outline viewer from ctags
	Plug 'majutsushi/tagbar'
	" gtags: GNU Global plugin
	Plug 'vim-scripts/gtags.vim'
" }

" Display {
	" BlockDiff: show diff selected texts
	Plug 'ryochack/BlockDiff'
	" quickhl: multiple highlights
	Plug 't9md/vim-quickhl'
	" lightline: make status line rich
	Plug 'itchyny/lightline.vim'
	" ColorScheme
	Plug 'w0ng/vim-hybrid'
" }

" Move {
	" visualstar: search text in visual selection
	Plug 'thinca/vim-visualstar'
" }

" Encoding {
	" recognize_charcode: resolve garbled characters
	" Plug 'banyan/recognize_charcode.vim'
" }

" Utility {
	" vimdoc-ja: japanese vim documents
	Plug 'vim-jp/vimdoc-ja'
	" junkfile: make temp file
	Plug 'Shougo/junkfile.vim'
	" vimproc: async plugin
	Plug 'Shougo/vimproc', { 'do': 'make' }
		" 'windows' : 'tools\\update-dll-mingw'
		" 'cygwin' : 'make -f make_cygwin.mak'
		" 'mac' : 'make -f make_mac.mak'
		" 'linux' : 'make'
		" 'unix' : 'gmake'
" }

" Git {
	" fugitive: git plugin
	Plug 'tpope/vim-fugitive'
	" webapi: vim Interface to Web API (required by gist)
	Plug 'mattn/webapi-vim'
	" gist: gist plugin
	Plug 'mattn/gist-vim'
" }

" Language Server Protocol {
	" language server
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
" }

" FileType {
	" rust
	Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
	" toml
	Plug 'cespare/vim-toml', { 'for' : 'toml' }
" }

call plug#end()

