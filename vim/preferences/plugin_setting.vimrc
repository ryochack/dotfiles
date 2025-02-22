" this file encoding
scriptencoding utf-8

"===================
"  Plugin settings
"===================

" Check the plugin is installed or not by vim-plug
function s:is_plugged(name)
	if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
		return 1
	else
		return 0
	endif
endfunction

"--------------------------------
"  matchit (vim embedded macro)
"--------------------------------
let b:match_ignorecase = 0
" For function enhancement. Describe the braces to be supported.
let b:match_words = '\<if\>:\<endif\>,'
			\ . '\<while\>:\<continue\>:\<break\>:\<endwhile\>'

"------------
"  Operator
"------------
if s:is_plugged('vim-operator-replace')
	" --- key mappping ---
	" "{register}_{motion}  <Plug>(operator-replace)
	" -> Replace text that {motion} moves over with register x.
	map _ <Plug>(operator-replace)
endif

" [surround]
	" OldText                  Command    NewText
	" -------------------------------------------------------------
	" "Hello *world!"          ds"        Hello world!
	" [123+4*56]/2             cs])       (123+456)/2
	" "Look ma, I'm *HTML!"    cs"<q>     <q>Look ma, I'm HTML!</q>
	" if *x>3 {                ysW(       if ( x>3 ) {
	" my $str = *whee!;        vllllS'    my $str = 'whee!';
	" "Hello *world!"          ds"        Hello world!
	" (123+4*56)/2             ds)        123+456/2
	" <div>Yo!*</div>          dst        Yo!
	" "Hello *world!"          cs"'       'Hello world!'
	" "Hello *world!"          cs"<q>     <q>Hello world!</q>
	" (123+4*56)/2             cs)]       [123+456]/2
	" (123+4*56)/2             cs)[       [ 123+456 ]/2
	" <div>Yo!*</div>          cst<p>     <p>Yo!</p>
	" Hello w*orld!            ysiw)      Hello (world)!
	" Hello w*orld!            yssB       {Hello world!}

"--------
"  Edit
"--------
if s:is_plugged('vim-commentary')
	augroup VimCommentaryFileTypes
		autocmd FileType toml setlocal commentstring=#\ %s
	augroup END
endif

if s:is_plugged('fitpaste-vim')
	vnoremap [fitpaste] <Nop>
	vmap     . [fitpaste]
	vmap <silent> [fitpaste]i <Plug>(fitpaste-insert)
	vmap <silent> [fitpaste]a <Plug>(fitpaste-append)
	vmap <silent> [fitpaste]p <Plug>(fitpaste-replace)
endif

"-------
"  Tag
"-------
if s:is_plugged('tagbar')
	let g:tagbar_left  = 1
	let g:tagbar_width = 40
	let g:tagbar_zoomwidth = 1
	let g:tagbar_autoclose = 0
	let g:tagbar_autofocus = 1
	let g:tagbar_sort = 0
	let g:tagbar_compact = 0
	let g:tagbar_indent = 2
	let g:tagbar_show_visibility = 1
	let g:tagbar_show_linenumbers = 0
	let g:tagbar_hide_nonpublic = 0
	let g:tagbar_expand = 0
	let g:tagbar_singleclick = 0
	let g:tagbar_foldlevel = 99
	let g:tagbar_autoshowtag = 0
	let g:tagbar_previewwin_pos = 'topleft'
	let g:tagbar_autopreview = 0
endif

if s:is_plugged('gtags.vim')
	nnoremap <F5> :<C-u>Gtags <C-r><C-w><CR>
	nnoremap <F6> :<C-u>Gtags -r <C-r><C-w><CR>
endif

"-----------
"  Display
"-----------
if s:is_plugged('vim-quickhl')
	nmap <Space>m <Plug>(quickhl-manual-this)
	xmap <Space>m <Plug>(quickhl-manual-this)
	nmap <Space>t <Plug>(quickhl-manual-toggle)
	nmap <Space>M <Plug>(quickhl-manual-reset)
	xmap <Space>M <Plug>(quickhl-manual-reset)
	nmap <Space>j <Plug>(quickhl-cword-toggle)
	xmap <Space>j <Plug>(quickhl-cword-toggle)
endif

if s:is_plugged('lightline.vim')
	let g:lightline = {
				\ 'colorscheme': 'wombat',
				\ 'mode_map': {'c': 'NORMAL'},
				\ 'active': {
				\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
				\ },
				\ 'component_function': {
				\   'modified': 'MyModified',
				\   'readonly': 'MyReadonly',
				\   'fugitive': 'MyFugitive',
				\   'filename': 'MyFilename',
				\   'fileformat': 'MyFileformat',
				\   'filetype': 'MyFiletype',
				\   'fileencoding': 'MyFileencoding',
				\   'mode': 'MyMode'
				\ }
				\ }

	function! MyModified()
		return &filetype =~# 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! MyReadonly()
		return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
	endfunction

	function! MyFilename()
		return ('' !=# MyReadonly() ? MyReadonly() . ' ' : '') .
					\ (&filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
					\ '' !=# expand('%:t') ? expand('%:t') : '[No Name]') .
					\ ('' !=# MyModified() ? ' ' . MyModified() : '')
	endfunction

	function! MyFugitive()
		try
			if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
				return fugitive#head()
			endif
		catch
		endtry
		return ''
	endfunction

	function! MyFileformat()
		return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! MyFiletype()
		return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
	endfunction

	function! MyFileencoding()
		return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
	endfunction

	function! MyMode()
		return winwidth(0) > 60 ? lightline#mode() : ''
	endfunction
	set t_Co=256
	"set encoding=utf-8
endif

if s:is_plugged('vim-hybrid')
	colorscheme hybrid
endif

"-------
"  Git
"-------
if s:is_plugged('gist-vim')
	let g:gist_detect_filetype = 1
endif

"------------
"  FileType
"------------
if s:is_plugged('rust.vim')
	let g:rust_recommended_style = 1
	let g:rustfmt_autosave = 0
	let g:rustfmt_command = $HOME.'/.cargo/bin/rustfmt'
endif

"----------------------------
"  Language Server Protocol
"----------------------------
if s:is_plugged('vim-lsp')
	augroup VimLsps
		autocmd!

		" [ C/C++ ]
		if executable('clangd')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'clangd',
						\ 'cmd': {server_info->['clangd']},
						\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
						\ })
		endif

		" [ Go ]
		"if executable('gopls')
		"	au User lsp_setup call lsp#register_server({
		"		\ 'name': 'gopls',
		"		\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
		"		\ 'whitelist': ['go'],
		"		\ })
		"endif
		if executable('go-langserver')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'go-langserver',
						\ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
						\ 'whitelist': ['go'],
						\ })
		endif

		" [ Rust ]
		if executable('rls')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'rls',
						\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
						\ 'whitelist': ['rust'],
						\ })
		endif

		" [ Python ] : python-language-server
		if executable('pyls')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'pyls',
						\ 'cmd': {server_info->['pyls']},
						\ 'whitelist': ['python'],
			"\ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
						\ })
		endif

		" [ Bash ]
		if executable('bash-language-server')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'bash-language-server',
						\ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
						\ 'whitelist': ['sh'],
						\ })
		endif

		" [ Haskell ] : haskell-ide-engine
		if executable('hie-wrapper')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'hie',
						\ 'cmd': {server_info->['hie-wrapper']},
						\ 'whitelist': ['haskell'],
						\ })
		endif

		" [ D ]
		if executable('dls')
			au User lsp_setup call lsp#register_server({
						\ 'name': 'dls',
						\ 'cmd': {server_info->['dls']},
						\ 'whitelist': ['d'],
						\ })
		endif

	augroup END

	let g:lsp_async_completion = 1

	" disable vim-lsp diagnostics. use ale.
	let g:lsp_diagnostics_enabled = 0
	let g:lsp_signs_enabled = 1
	let g:lsp_diagnostics_echo_cursor = 1
	let g:lsp_signs_error = {'text': '✗'}
	let g:lsp_signs_warning = {'text': '‼'}
endif

if s:is_plugged('asyncomplete.vim')
	let g:asyncomplete_remove_duplicates = 1
	let g:asyncomplete_auto_popup = 1

	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
endif

