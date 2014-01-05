"**********************************************************
"     プラグイン設定 Plugins
"**********************************************************

"========================================
"    operator
"----------------------------------------
"# replace
map _ <Plug>(operator-replace)
"# camelize
map <Space>c <Plug>(operator-camelize)
map <Space>C <Plug>(operator-decamelize)
"# sort
map <Space>s <Plug>(operator-sort)


"========================================
"    yankround
"----------------------------------------
set viminfo+=!
let g:yankround_dir = $HOME.'/.vim/temp'
let g:yankround_max_history = 30
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


"========================================
"    sequence
"----------------------------------------
"# 連番をふる
vmap <silent> <M-u> <plug>SequenceV_Increment
vmap <silent> <M-d> <plug>SequenceV_Decrement
nmap <silent> <M-u> <plug>SequenceN_Increment
nmap <silent> <M-d> <plug>SequenceN_Decrement
"# 値を足す
vmap <silent> <M-a> <plug>SequenceAdd
vmap <silent> <M-s> <plug>SequenceSubtract


"========================================
"    gtags
"----------------------------------------
nnoremap <F5> :<C-u>Gtags <C-r><C-w><CR>
nnoremap <F6> :<C-u>Gtags -r <C-r><C-w><CR>


"========================================
"    neocomplcache
"----------------------------------------
"# 自動補完有効
let g:neocomplcache_enable_at_startup=1
"# ポップアップMENUの最大高さ
let g:neocomplcache_max_list=20
"# smart case 有効
let g:neocomplcache_enable_smart_case=1
"# 補完候補を探すときに、大文字・小文字を無視するか(1ならば無視)
let g:neocomplcache_enable_ignore_case=1
"# 大文字小文字を区切りとしたあいまい検索を行うかどうか
let g:neocomplcache_enable_camel_case_completion=0
"# _(UnderBar)区切りの補完を有効
let g:neocomplcache_enable_underbar_completion=0
"# WildCard '*' での省略有効
"let g:neocomplcache_enable_wildcard=1
"# 自動補完を開始するキーワードの長さ設定
let g:neocomplcache_auto_completion_start_length=2
"# 手動補完を開始するキーワードの長さ設定
let g:neocomplcache_auto_completion_start_length=3
"# 自動補完時に１番上の候補を自動的に選択するかどうか
let g:neocomplcache_enable_auto_select=0
"# バッファや辞書ファイル内で補完の対象となるキーワードの最小長さ
let g:neocomplcache_min_keyword_length=4
"# シンタックスファイル内で補完の対象となるキーワードの最小長さ
let g:neocomplcache_min_syntax_length=4
"# neocomplcacheが一時ファイルを書き出すディレクトリを指定
let g:neocomplcache_temporary_dir=$HOME.'/.vim/temp/.neocon'

"# ファイルタイプ毎にneocomplcacheの辞書を設定する
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
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

nnoremap [neocomplcache] <Nop>
nmap     ,c [neocomplcache]
inoremap <expr><C-g> neocomplcache#undo_completion()


"========================================
"    neosnippet
"----------------------------------------
"# <C-k>でスニペット展開しパラメータ入力し<Tab>で次の入力へ
"# 標準のスニペットを無効にする
let g:neosnippet#disable_runtime_snippets = {
	\ '_' : 1,
	\ }
"# スニペットファイルを読み込むディレクトリを指定
let g:neosnippet#snippets_directory=$HOME.'/.vim/bundle/snipmate-snippets/snippets' .','. $HOME.'/.vim/snippet'

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


"========================================
"    visualstar
"----------------------------------------
"# 検索した後に移動しない設定
"	map *  <Plug>(visualstar-*)N
"	map #  <Plug>(visualstar-#)N
"	map g* <Plug>(visualstar-g*)N
"	map g# <Plug>(visualstar-g#)N


"========================================
"    quickrun
"----------------------------------------
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


"========================================
"    quickhl
"----------------------------------------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>t <Plug>(quickhl-manual-toggle)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
xmap <Space>j <Plug>(quickhl-cword-toggle)


"========================================
"    Gist
"----------------------------------------
let g:gist_detect_filetype=1


"========================================
"    Fugitive
"----------------------------------------
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


"========================================
"    poslist
"----------------------------------------
let g:poslist_histsize=200
nmap <C-o> <Plug>(poslist-prev-pos)
nmap <C-i> <Plug>(poslist-next-pos)


"========================================
"    ctrlp
"----------------------------------------
let g:ctrlp_map='<Space><Space>'
let g:ctrlp_use_migemo=1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dip = $HOME.'/.vim/temp/.ctrlp_cache'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_mruf_max = 500
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_extensions = ['line', 'undo', 'changes', 'yankround', 'tag', 'buffertag', 'quickfix', 'dir']
" ['rtscript', 'mixed', 'bookmarkdir']
nnoremap [ctrlp] <Nop>
nmap     ,p [ctrlp]
nnoremap [ctrlp]p :<C-u>CtrlP<Space>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<CR>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMRU<CR>
nnoremap <silent> [ctrlp]t :<C-u>CtrlPTag<CR>
nnoremap <silent> [ctrlp]q :<C-u>CtrlPQuickfix<CR>
nnoremap <silent> [ctrlp]d :<C-u>CtrlPDir<Space>
nnoremap <silent> [ctrlp]u :<C-u>CtrlPUndo<CR>
nnoremap <silent> [ctrlp]l :<C-u>CtrlPLine<CR>
nnoremap <silent> [ctrlp]c :<C-u>CtrlPChangeAll<CR>
nnoremap <silent> [ctrlp]y :<C-u>CtrlPYankRound<CR>


"========================================
"    lightline
"----------------------------------------
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
set t_Co=256
set encoding=utf-8


"========================================
"    fitpaste
"----------------------------------------
vnoremap [fitpaste] <Nop>
vmap     f [fitpaste]
vmap <silent> [fitpaste]i <Plug>(fitpaste-insert)
vmap <silent> [fitpaste]a <Plug>(fitpaste-append)
vmap <silent> [fitpaste]p <Plug>(fitpaste-replace)


