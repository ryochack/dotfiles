"======================================================================
"    neocomplcache.vim の設定
"======================================================================

"# 自動補完有効
let g:neocomplcache_enable_at_startup=1
"# ポップアップMENUの最大高さ
"let g:neocomplcache_max_list=20
"# smart case 有効
let g:neocomplcache_enable_smart_case=1
"# _(UnderBar)区切りの補完を有効
let g:neocomplcache_enable_underbar_completion=1
"# WildCard '*' での省略有効
"let g:neocomplcache_enable_wildcard=1
"# 自動補完を開始するキーワードの長さ設定
let g:neocomplcache_auto_completion_start_length=3
"# 自動補完時に１番上の候補を自動的に選択するかどうか
let g:neocomplcache_enable_auto_select=0
"# neocomplcacheが一時ファイルを書き出すディレクトリを指定
let g:neocomplcache_temporary_dir=$HOME . '/.vim/temp/.neocon'

"# スニペット展開を使用する
"# :NeoComplcacheEditSnippets ($filetype) でスニペット編集
" スニペットファイルを読み込むディレクトリを指定
let g:neocomplcache_snippets_dir=$HOME . '/.vim/snippet'

