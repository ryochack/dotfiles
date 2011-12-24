"======================================================================
"    smartchr.vim の設定
"======================================================================

" '='を入力する度に順次入力されるパターン
"inoremap <expr> = smartchr#loop(' = ', '=', ' == ', '==')
"inoremap <expr> , smartchr#loop(', ', ',')
" Buffer毎の設定になるため、<buffer>が必要
autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->')

