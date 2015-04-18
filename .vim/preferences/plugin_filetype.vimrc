"##### golang #####
"========================================
"    vim-go
"----------------------------------------
if neobundle#is_installed("vim-go")
	let g:go_bin_path = expand("~/.vim-go")
	let g:go_snippet_engine = "neosnippet"
	autocmd FileType go nnoremap gd <Plug>(go-def)
endif

"========================================
"    vim_goshrepl
"----------------------------------------
if neobundle#is_installed("vim_goshrepl")
	vmap <CR> <Plug>(gosh_repl_send_block)
endif

