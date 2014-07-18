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


augroup FileTypeC
	autocmd!
	" 辞書設定
	autocmd FileType c,cc,cpp,h set cindent
	autocmd FileType c,h set dictionary+=~/.vim/dict/c.dict
	autocmd FileType cc,cpp,h set dictionary+=~/.vim/dict/cpp.dict
	" FileType毎のOmni補完を設定
	autocmd FileType c set omnifunc=ccomplete#Complete
	"そのファイルタイプにあわせたインデントを利用する
	"autocmd FileType c   setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
augroup END


augroup FileTypeGo
	autocmd!
	autocmd FileType go set dictionary+=~/.vim/dict/go.dict
augroup END


augroup FileTypeRuby
	autocmd!
	autocmd FileType ruby set omnifunc=rubycomplete#Complete
augroup END


augroup FileTypePython
	autocmd!
	autocmd FileType python set omnifunc=pythoncomplete#Complete
augroup END


augroup FileTypeJavaScript
	autocmd!
	autocmd FileType javascript set dictionary+=~/.vim/dict/javascript.dict
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
augroup END


augroup FileTypeCss
	autocmd!
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END


augroup FileTypeHtml
	autocmd!
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END


augroup FileTypeXml
	autocmd!
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
augroup END


augroup FileTypePhp
	autocmd!
	autocmd FileType php set dictionary+=~/.vim/dict/php.dict
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
augroup END


augroup FileTypeVerilog
	autocmd!
	autocmd FileType verilog set dictionary+=~/.vim/dict/php.dict
	autocmd FileType verilog set omnifunc=phpcomplete#CompletePHP
augroup END

