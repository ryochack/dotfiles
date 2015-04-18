"**********************************************************
"     プラグイン設定 Plugins
"**********************************************************

"========================================
"    matchit (vim embedded macro)
"----------------------------------------
let b:match_ignorecase = 0
" 機能拡張用。対応させたいブレースを記述する
let b:match_words = '\<if\>:\<endif\>,'
			\ . '\<while\>:\<continue\>:\<break\>:\<endwhile\>'


"========================================
"    text object
"----------------------------------------
" [textobj-indent] インデントされたものをtext-object化
	" --- key mappping ---
	" ai  <Plug>(textobj-indent-a)
	" ii  <Plug>(textobj-indent-i)
	" aI  <Plug>(textobj-indent-same-a)
	" iI  <Plug>(textobj-indent-same-i)

" [textobj-syntax] シンタックスで定義されたものをtext-object化
	" --- key mappping ---
	" ay  <Plug>(textobj-syntax-a)
	" iy  <Plug>(textobj-syntax-i)

" [textobj-function] 関数の中身をtext-object化
	" --- key mappping ---
	" af  <Plug>(textobj-function-a)
	" if  <Plug>(textobj-function-i)
	" aF  <Plug>(textobj-function-A)
	" iF  <Plug>(textobj-function-I)

" [textobj-fold] 折り畳みをtext-object化
	" --- key mappping ---
	" az  <Plug>(textobj-fold-a)
	" iz  <Plug>(textobj-fold-i)

" [textobj-entire] バッファ全体をtext-object化
	" --- key mappping ---
	" ae  <Plug>(textobj-entire-a)
	" ie  <Plug>(textobj-entire-i)

" [textobj-line] 行をtext-object化
	" --- key mappping ---
	" al  <Plug>(textobj-line-a)
	" il  <Plug>(textobj-line-i)

" [textobj-jabraces] 「foo」や【bar】などのブレースをtext-object化
	" --- key mappping ---
	" ajb  <Plug>(textobj-jabraces-parens-a)
	" aj(  <Plug>(textobj-jabraces-parens-a)
	" aj)  <Plug>(textobj-jabraces-parens-a)
	" ajB  <Plug>(textobj-jabraces-braces-a)
	" aj{  <Plug>(textobj-jabraces-braces-a)
	" aj}  <Plug>(textobj-jabraces-braces-a)
	" ajr  <Plug>(textobj-jabraces-brackets-a)
	" aj[  <Plug>(textobj-jabraces-brackets-a)
	" aj]  <Plug>(textobj-jabraces-brackets-a)
	" aja  <Plug>(textobj-jabraces-angles-a)
	" aj<  <Plug>(textobj-jabraces-angles-a)
	" aj>  <Plug>(textobj-jabraces-angles-a)
	" ajA  <Plug>(textobj-jabraces-double-angles-a)
	" ajk  <Plug>(textobj-jabraces-kakko-a)
	" ajK  <Plug>(textobj-jabraces-double-kakko-a)
	" ajy  <Plug>(textobj-jabraces-yama-kakko-a)
	" ajY  <Plug>(textobj-jabraces-double-yama-kakko-a)
	" ajt  <Plug>(textobj-jabraces-kikkou-kakko-a)
	" ajs  <Plug>(textobj-jabraces-sumi-kakko-a)
	" ijb  <Plug>(textobj-jabraces-parens-i)
	" ij(  <Plug>(textobj-jabraces-parens-i)
	" ij)  <Plug>(textobj-jabraces-parens-i)
	" ijB  <Plug>(textobj-jabraces-braces-i)
	" ij{  <Plug>(textobj-jabraces-braces-i)
	" ij}  <Plug>(textobj-jabraces-braces-i)
	" ijr  <Plug>(textobj-jabraces-brackets-i)
	" ij[  <Plug>(textobj-jabraces-brackets-i)
	" ij]  <Plug>(textobj-jabraces-brackets-i)
	" ija  <Plug>(textobj-jabraces-angles-i)
	" ij<  <Plug>(textobj-jabraces-angles-i)
	" ij>  <Plug>(textobj-jabraces-angles-i)
	" ijA  <Plug>(textobj-jabraces-double-angles-i)
	" ijk  <Plug>(textobj-jabraces-kakko-i)
	" ijK  <Plug>(textobj-jabraces-double-kakko-i)
	" ijy  <Plug>(textobj-jabraces-yama-kakko-i)
	" ijY  <Plug>(textobj-jabraces-double-yama-kakko-i)
	" ijt  <Plug>(textobj-jabraces-kikkou-kakko-i)
	" ijs  <Plug>(textobj-jabraces-sumi-kakko-i)

" [textobj-comment] コメントをtext-object化
	" --- key mappping ---
	" ac  <Plug>(textobj-comment-a)
	" ic  <Plug>(textobj-comment-i)

" [textobj-between] 任意の区切り文字の間をtext-object化
	" --- key mappping ---
	" af  <Plug>(textobj-between-a)
	" if  <Plug>(textobj-between-i)

" [textobj-wiw] wordの中の単語をtext-object化
	" --- key mappping ---
	" <Space>w   <Plug>(textobj-wiw-n)
	" <Space>b   <Plug>(textobj-wiw-p)
	" <Space>e   <Plug>(textobj-wiw-N)
	" <Space>ge  <Plug>(textobj-wiw-P)
	" a<Space>w  <Plug>(textobj-wiw-a)
	" i<Space>w  <Plug>(textobj-wiw-i)
if neobundle#is_installed("vim-operator-replace")
	let g:textobj_wiw_default_key_mappings_prefix='<Space>'
endif


"========================================
"    operator
"----------------------------------------
" [operator-replace] Yankしたもので選択範囲を置換する
	" --- key mappping ---
	" "{register}_{motion}  <Plug>(operator-replace)
	" -> Replace text that {motion} moves over with register x.
if neobundle#is_installed("vim-operator-replace")
	map _ <Plug>(operator-replace)
endif

" [surround] テキストオブジェクトに対する括弧編集
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


"========================================
"    yankround
"----------------------------------------
if neobundle#is_installed("yankround.vim")
	set viminfo+=!
	let g:yankround_dir = $HOME.'/.cache/vim/yankround'
	let g:yankround_max_history = 50
	nmap p <Plug>(yankround-p)
	xmap p <Plug>(yankround-p)
	nmap P <Plug>(yankround-P)
	nmap gp <Plug>(yankround-gp)
	xmap gp <Plug>(yankround-gp)
	nmap gP <Plug>(yankround-gP)
	nmap <C-p> <Plug>(yankround-prev)
	nmap <C-n> <Plug>(yankround-next)
endif


"========================================
"    fitpaste
"----------------------------------------
if neobundle#is_installed("fitpaste-vim")
	vnoremap [fitpaste] <Nop>
	vmap     . [fitpaste]
	vmap <silent> [fitpaste]i <Plug>(fitpaste-insert)
	vmap <silent> [fitpaste]a <Plug>(fitpaste-append)
	vmap <silent> [fitpaste]p <Plug>(fitpaste-replace)
endif


"========================================
"    neocomplete
"----------------------------------------
if neobundle#is_installed("neocomplete")
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#max_list = 100
	let g:neocomplete#max_keyword_width = 80
	let g:neocomplete#auto_completion_start_length = 2
	let g:neocomplete#manual_completion_start_length = 1
	let g:neocomplete#min_keyword_length = 4
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#enable_camel_case = 0
	let g:neocomplete#disable_auto_complete = 0
	let g:neocomplete#enable_auto_select = 0
	let g:neocomplete#enable_auto_delimiter = 0
	let g:neocomplete#enable_fuzzy_completion = 1
 	let g:neocomplete#data_directory = $HOME.'/.cache/vim/neocomplete'
	" This dictionary records keyword patterns to completion
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
	" define delimiter each filetype
	if !exists('g:neocomplete#delimiter_patterns')
		let g:neocomplete#delimiter_patterns= {}
	endif
	let g:neocomplete#delimiter_patterns.vim = ['#']
	let g:neocomplete#delimiter_patterns.cpp = ['::']
	" a dictionary to decide use source names
	if !exists('g:neocomplete#sources')
		let g:neocomplete#sources = {}
	endif
	let g:neocomplete#sources._   = ['buffer']
	let g:neocomplete#sources.c   = ['buffer', 'include']
	let g:neocomplete#sources.cpp = ['buffer', 'include']
	let g:neocomplete#release_cache_time = 900
	let g:neocomplete#skip_auto_completion_time = "0.3"
	let g:neocomplete#enable_auto_close_preview = 1
	let g:neocomplete#sources#buffer#cache_limit_size = 500000
	let g:neocomplete#sources#buffer#max_keyword_width = 80
	let g:neocomplete#sources#dictionary#dictionaries = {
				\ '_'       : '',
				\ 'c'       : $HOME.'/.vim/dict/c.dict',
				\ 'cpp'     : $HOME.'/.vim/dict/cpp.dict',
				\ 'go'      : $HOME.'/.vim/dict/go.dict',
				\ 'java'    : $HOME.'/.vim/dict/java.dict',
				\ 'ruby'    : $HOME.'/.vim/dict/ruby.dict',
				\ 'scheme'  : $HOME.'/.vim/dict/scheme.dict',
				\ 'python'  : $HOME.'/.vim/dict/python.dict',
				\ 'verilog' : $HOME.'/.vim/dict/verilog.dict',
				\ 'vim'     : $HOME.'/.vim/dict/vim.dict'
				\ }
	let g:neocomplete#sources#syntax#min_keyword_length = 4
endif


"========================================
"    neosnippet
"----------------------------------------
if neobundle#is_installed("neosnippet")
	"# <C-k>でスニペット展開しパラメータ入力し<Tab>で次の入力へ
	"# 標準のスニペットを無効にする
	let g:neosnippet#disable_runtime_snippets = {
				\ '_' : 1,
				\ }
	"# スニペットファイルを読み込むディレクトリを指定
	let g:neosnippet#snippets_directory = $HOME.'/.vim/bundle/snipmate-snippets/snippets' .','. $HOME.'/.vim/snippet'
 	let g:neosnippet#data_directory = $HOME.'/.cache/vim/neosnippet'

	"# Plugin key-mappings.
	imap <C-k> <Plug>(neosnippet_expand_or_jump)
	smap <C-k> <Plug>(neosnippet_expand_or_jump)

	"# SuperTab like snippets behavior.
	imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

	"# For snippet_complete marker.
	if has('conceal')
		set conceallevel=2 concealcursor=i
	endif
endif


"========================================
"    tagbar
"----------------------------------------
if neobundle#is_installed("tagbar")
	let g:tagbar_left  = 0
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
	let g:tagbar_previewwin_pos = "topleft"
	let g:tagbar_autopreview = 0
endif


"========================================
"    gtags
"----------------------------------------
if neobundle#is_installed("gtags.vim")
	nnoremap <F5> :<C-u>Gtags <C-r><C-w><CR>
	nnoremap <F6> :<C-u>Gtags -r <C-r><C-w><CR>
endif


"========================================
"    quickhl
"----------------------------------------
if neobundle#is_installed("vim-quickhl")
	nnoremap <Space>m <Plug>(quickhl-manual-this)
	xnoremap <Space>m <Plug>(quickhl-manual-this)
	nnoremap <Space>t <Plug>(quickhl-manual-toggle)
	nnoremap <Space>M <Plug>(quickhl-manual-reset)
	xnoremap <Space>M <Plug>(quickhl-manual-reset)
	nnoremap <Space>j <Plug>(quickhl-cword-toggle)
	xnoremap <Space>j <Plug>(quickhl-cword-toggle)
endif


"========================================
"    smartword
"----------------------------------------
if neobundle#is_installed("vim-smartword")
	map w  <Plug>(smartword-w)
	map b  <Plug>(smartword-b)
	map e  <Plug>(smartword-e)
	map ge <Plug>(smartword-ge)
endif


"========================================
"    ag
"----------------------------------------
if neobundle#is_installed("ag.vim")
	let g:aghighlight = 1
endif


"========================================
"    vimfiler
"----------------------------------------
if neobundle#is_installed("vimfiler")
	let g:vimfiler_as_default_explorer = 1
	let g:vimfiler_data_directory = $HOME.'/.cache/vim/vimfiler'
endif


"========================================
"    quickrun
"----------------------------------------
if neobundle#is_installed("vim-quickrun")
	" launch quickrun : <Leader>r
	"# build成功時にはBuffer / 失敗時にはQuickFixで開く
	"# vimprocで非同期実行
	let g:quickrun_config = {
				\	'_': {
				\		'outputter' : 'error',
				\		'outputter/buffer/split' : ':botright 8sp',
				\		'outputter/buffer/close_on_empty' : 1,
				\		'outputter/error/success' : 'buffer',
				\		'outputter/error/error' : 'quickfix',
				\		'runner' : 'vimproc',
				\		'runner/vimproc/updatetime' : 60,
				\		'runner/vimproc/sleep' : 10,
				\		'hook/time/enable' : 1,
				\	},
				\}
	"# <C-c> で実行を強制終了させる
	"# quickrun.vim が実行していない場合には <C-c> を呼び出す
	nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
endif


"========================================
"    vinarise
"----------------------------------------
if neobundle#is_installed("vinarise")
endif


"========================================
"    lightline
"----------------------------------------
if neobundle#is_installed("lightline.vim")
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
		return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! MyReadonly()
		return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
	endfunction

	function! MyFilename()
		return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
					\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
					\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
					\ ('' != MyModified() ? ' ' . MyModified() : '')
	endfunction

	function! MyFugitive()
		try
			if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
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
		return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
	endfunction

	function! MyMode()
		return winwidth(0) > 60 ? lightline#mode() : ''
	endfunction
	set t_Co=256
	set encoding=utf-8
endif


"========================================
"    ctrlp
"----------------------------------------
if neobundle#is_installed("ctrlp.vim")
	let g:ctrlp_map = '<Nop>'
	let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
	"let g:ctrlp_switch_buffer = 't'
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_use_caching = 1
	let g:ctrlp_clear_cache_on_exit = 0
	let g:ctrlp_cache_dir = $HOME.'/.cache/vim/ctrlp'
	let g:ctrlp_show_hidden = 0
	let g:ctrlp_custom_ignore = {
				\ 'dir':  '\v[\/]\.(git|hg|svn)$',
				\ 'file': '\v\.(exe|so|dll)$',
				\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
				\ }
	let g:ctrlp_max_files = 10000
	let g:ctrlp_max_depth = 40
	let g:ctrlp_open_new_file = 'r'
	let g:ctrlp_follow_symlinks = 0
	let g:ctrlp_use_migemo = 1
	let g:ctrlp_mruf_max = 200
	let g:ctrlp_mruf_relative = 0
	let g:ctrlp_extensions = [
				\ 'line', 'undo', 'changes', 'yankround',
				\ 'tag', 'buffertag', 'quickfix', 'dir'
				\ ]
	" ['rtscript', 'mixed', 'bookmarkdir']
endif


"========================================
"    Unite
"----------------------------------------
if neobundle#is_installed("unite.vim")
	" uniteバッファを常にインサートモードで起動する
	"let g:unite_enable_start_insert = 1
	"# uniteのウィンドウを生成する際、画面分割の位置ルールを指定する。
	"# "topleft" or "botright"
	let g:unite_split_rule = 'botright'
	"# uniteのウィンドウを垂直分割にするかどうかを制御する。1ならば垂直分割にする。
	let g:unite_enable_split_vertically  =0
endif


"========================================
"    Fugitive
"----------------------------------------
if neobundle#is_installed("vim-fugitive")
endif


"========================================
"    Gist
"----------------------------------------
if neobundle#is_installed("gist-vim")
	let g:gist_detect_filetype = 1
endif


"========================================
"    Hybrid
"----------------------------------------
if neobundle#is_installed("vim-hybrid")
	colorscheme hybrid
endif
