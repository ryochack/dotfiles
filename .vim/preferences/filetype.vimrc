"**********************************************************
"     filetype
"**********************************************************
" filetype定義
" $VIMRUNTIME/filetype.vimで定義されていないものを追加定義する
augroup DefineFileType
	autocmd!
	autocmd BufNewFile,BufRead *.go set filetype=go
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

" 辞書設定
autocmd FileType c,cc,cpp,h set cindent
autocmd FileType c,h set dictionary+=~/.vim/dict/c.dict
autocmd FileType cc,cpp,h set dictionary+=~/.vim/dict/cpp.dict

" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" 文字コード認識はbanyan/recognize_charcode.vimへ
" cvsの時は文字コードをeuc-jpに設定
autocmd FileType cvs set fileencoding=euc-jp
" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType svn set fileencoding=utf-8
autocmd FileType js set fileencoding=utf-8
autocmd FileType css set fileencoding=utf-8
autocmd FileType html set fileencoding=utf-8
autocmd FileType xml set fileencoding=utf-8
autocmd FileType java set fileencoding=utf-8
autocmd FileType scala set fileencoding=utf-8

if has("autocmd")
	"ファイルタイプの検索を有効にする
	filetype plugin on
	"そのファイルタイプにあわせたインデントを利用する
	filetype indent on
"	" これらのftではインデントを無効に
"	"autocmd FileType php filetype indent off
"
"	autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType go         setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
	autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType verilog    setlocal sw=2 sts=2 ts=2 et
"	autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
"	autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
endif

