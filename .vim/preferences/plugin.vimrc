"**********************************************************
"     プラグイン設定 Plugins
"**********************************************************
"========================================
"    eregex
"----------------------------------------
let g:eregex_default_enable=0
nnoremap ,/ :<C-u>M/
nnoremap ,? :<C-u>M?


"========================================
"    yankring
"----------------------------------------
"# Yankの履歴を管理
"# 再起動後も履歴を保持
set viminfo+=!
"# YankRing有効
let g:yankring_enabled=1
let g:yankring_max_history=20
let g:yankring_max_display=20
"# 重複した履歴は追加しない
let g:yankring_ignore_duplicate=1
"# ClipBoardをモニタリングする
let g:yankring_clipboard_monitor=1
"# '.'を置き換えない
let g:yankring_map_dot=0
"# yankring_historyファイルの場所
let g:yankring_history_dir=$HOME.'/.vim/temp'
"# yankring_historyファイルの名前
let g:yankring_history_file='vim_yankring_hist'


"========================================
"    bufexplorer
"----------------------------------------
"# Helpを常に表示
let bufExplorerDetailedHelp=1


"========================================
"    DumbBuf
"----------------------------------------
"<Leader>b<Space>でBufferList
let dumbbuf_hotkey = '<Leader>b<Space>'
let dumbbuf_mappings = {
	\ 'n': {
	\ 	'<Esc>': { 'opt': '<silent>', 'mapto': ':<C-u>close<CR>' }
	\ }
	\ }
let dumbbuf_single_key  = 1
let dumbbuf_updatetime  = 1    " &updatetimeの最小値
let dumbbuf_wrap_cursor = 0
let dumbbuf_remove_marked_when_close = 1


"========================================
"    taglist
"----------------------------------------
nnoremap <F4> :<C-u>Tlist<CR>


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
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)
xmap <Space>j <Plug>(quickhl-match)


"========================================
"    unite
"----------------------------------------
"# uniteバッファを常にインサートモードで起動する
"let g:unite_enable_start_insert=1
"# uniteのウィンドウを生成する際、画面分割の位置ルールを指定する。
"# "topleft" or "botright"
let g:unite_split_rule='botright'
"# uniteのウィンドウを垂直分割にするかどうかを制御する。1ならば垂直分割にする。
let g:unite_enable_split_vertically=0

"------------------------------
"    unite-sources
"------------------------------
" [unite-ack]
let g:unite_source_ack_command = "ack"

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
nnoremap <silent> [unite]a  :<C-u>Unite ack -buffer-name=ack -no-quit<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep -buffer-name=grep -no-quit<CR>
nnoremap <silent> [unite]j  :<C-u>Unite jump -buffer-name=jumps<CR>
nnoremap <silent> [unite]q  :<C-u>Unite qf -buffer-name=quickfix -no-quit<CR>
nnoremap <silent> [unite]z  :<C-u>UniteResume


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
"    easymotion
"----------------------------------------
"# キーバインドの先頭キーの設定
"# デフォルトだと、'<Leader>'(\) が設定されている
"# <Space>w の様な呼び出しを行いたいなら下記の設定になる
"# let g:EasyMotion_leader_key = '<Leader>'
"# Custom HighLight
highlight EasyMotionTarget ctermbg=none ctermfg=green
"highlight EasyMotionShade  ctermbg=none ctermfg=blue


"========================================
"    ctrlp
"----------------------------------------
let g:ctrlp_map='<C-x>'
let g:ctrlp_use_migemo=1
let g:ctrlp_cache_dir = $HOME.'/.vim/temp/.ctrlp_cache'


"========================================
"    Powerline
"----------------------------------------
let g:Powerline_symbols='fancy'
set t_Co=256
set encoding=utf-8


"========================================
"    colorscheme:solarized
"----------------------------------------
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_hitrail=0
let g:solarized_menu=1
let g:solarized_contrast="high"
let g:solarized_visibility="low"


"========================================
"    cmigemo
"----------------------------------------
if has ('migemo')
	set migemo
	set migemodict=~/.vim/opt/cmigemo/dict/utf-8.d/migemo-dict
endif


"========================================
"    fitpaste
"----------------------------------------
vnoremap [fitpaste] <Nop>
vmap     f [fitpaste]
vmap <silent> [fitpaste]i <Plug>(fitpaste-insert)
vmap <silent> [fitpaste]a <Plug>(fitpaste-append)
vmap <silent> [fitpaste]p <Plug>(fitpaste-replace)


"========================================
"    rsense
"----------------------------------------
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/.vim/opt/rsense-0.3')

function! SetUpRubySetting()
	setlocal completefunc=RSenseCompleteFunction
	nmap <buffer>tj :RSenseJumpToDefinition<CR>
	nmap <buffer>tk :RSenseWhereIs<CR>
	nmap <buffer>td :RSenseTypeHelp<CR>
endfunction
autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

" rubyの設定
if !exists('g:neocomplcache_omni_functions')
	let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.ruby = 'RSenseCompleteFunction'

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

