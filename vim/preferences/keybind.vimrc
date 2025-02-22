" this file encoding
scriptencoding utf-8

"==============
"  KeyBinding
"==============
" Key map leader
let mapleader = '\'
" noremap ; :
" noremap : ;

" Show help document for the keyword under the cursor
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>

" Disable ZZ and ZQ keymaps
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" Space do nothing
nmap <silent> <Space> <Nop>
xmap <silent> <Space> <Nop>

" If there are multiple candidates, select on before tag jumping
noremap <C-]> g<C-]>

" Erase highlight on pushing ESC twice
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>

" Move the display lines
nnoremap j gj
nnoremap k gk
" Move the actually lines
nnoremap gj j
nnoremap gk k

" EmacsKeyBind
lnoremap <C-a> <Home>
lnoremap <C-e> <End>

" QuickFix setting
augroup QuickFixSetting
	autocmd!
	" Close QuickFix by 'q' or ESC
	autocmd FileType qf nnoremap <buffer> q :ccl<CR>
	autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>
	" Jump by Enter on QuickFix list
	autocmd FileType qf nnoremap <buffer> <CR> :.cc<CR>
augroup END

" Copy/Paset using unnamed register
noremap gy "+y
noremap gp "+p
noremap gP "+P

" Enable Return
nnoremap <CR> i<CR><ESC>

" Get path to current directory
cnoremap <C-x> <C-r>=expand("%:p:h")<CR>/

" Turn off IME when exiting insert mode
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" Trace command history by <C-p>, <C-n>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

" for zeal
if has('unix')
	if executable('zeal')
		nnoremap <leader>d :call system('zeal '.&filetype.':'.expand("<cword>").'&')<CR>
		vnoremap <leader>d :call system('zeal '.&filetype.':'.expand(@*).'&')<CR>
	endif
endif

