"==================================================
"   FileType Setting
"--------------------------------------------------
filetype off
syntax off

" [ C/C++ ] {{{
autocmd FileType c,cc,cpp,h set cindent
autocmd FileType c,h set dictionary+=~/.vim/dict/c.dict
autocmd FileType cc,cpp,h set dictionary+=~/.vim/dict/cpp.dict
" }}}


" [ GO ]  {{{
set rtp+=$GOROOT/misc/vim
" }}}


" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

filetype plugin indent on
syntax enable

