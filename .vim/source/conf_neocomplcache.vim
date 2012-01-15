"======================================================================
"    neocomplcache.vim の設定
"======================================================================

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
let g:neocomplcache_temporary_dir=$HOME . '/.vim/temp/.neocon'

"# スニペット展開を使用する
"# :NeoComplcacheEditSnippets ($filetype) でスニペット編集
"# 標準のスニペットを無効にする
let g:neocomplcache_snippets_disable_runtime_snippets=0
" スニペットファイルを読み込むディレクトリを指定
let g:neocomplcache_snippets_dir=$HOME . '/.vim/snippet'

"# ファイルタイプ毎にneocomplcacheの辞書を設定する
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'c' : $HOME.'/.vim/dict/c.dict',
	\ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
	\ 'go' : $HOME.'/.vim/dict/go.dict',
	\ 'java' : $HOME.'/.vim/dict/java.dict',
	\ 'scheme' : $HOME.'/.vim/dict/schme.dict',
	\ 'vim' : $HOME.'/.vim/dict/vim.dict'
	\ }
