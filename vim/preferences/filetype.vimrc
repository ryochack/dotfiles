" this file encoding
scriptencoding utf-8

"**********************************************************
"     filetype
"**********************************************************
" filetype定義
" $VIMRUNTIME/filetype.vimで定義されていないものを追加定義する
augroup DefineFileType
	autocmd!
	autocmd BufNewFile,BufRead *.bash setlocal filetype=bash
	autocmd BufNewFile,BufRead *.go setlocal filetype=go
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
	autocmd BufNewFile,BufRead *.rs setlocal filetype=rust
	autocmd BufNewFile,BufRead *.toml setlocal filetype=toml
	autocmd BufNewFile,BufRead *.svd setlocal filetype=xml
	autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

augroup FileTypeC
	autocmd!
	" 辞書設定
	autocmd FileType c,cc,cpp,h setlocal cindent
	autocmd FileType c,h setlocal dictionary+=~/.vim/dict/c.dict
	autocmd FileType cc,cpp,h setlocal dictionary+=~/.vim/dict/cpp.dict
	" FileType毎のOmni補完を設定
	autocmd FileType c setlocal omnifunc=ccomplete#Complete
	"そのファイルタイプにあわせたインデントを利用する
	"autocmd FileType c   setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
augroup END

augroup FileTypeGo
	autocmd!
	autocmd FileType go setlocal dictionary+=~/.vim/dict/go.dict
augroup END

augroup FileTypeRust
	autocmd!
	autocmd FileType rust setlocal dictionary+=~/.vim/dict/rust.dict,~/.vim/dict/rust_attr.dict,~/.vim/dict/rust_macro.dict
augroup END

augroup FileTypeRuby
	autocmd!
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
augroup END

augroup FileTypePython
	autocmd!
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
augroup END

augroup FileTypeJavaScript
	autocmd!
	autocmd FileType javascript setlocal dictionary+=~/.vim/dict/javascript.dict
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

augroup FileTypeCss
	autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END

augroup FileTypeHtml
	autocmd!
	autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup FileTypeXml
	autocmd!
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

augroup FileTypePhp
	autocmd!
	autocmd FileType php setlocal dictionary+=~/.vim/dict/php.dict
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

augroup FileTypeVerilog
	autocmd!
	autocmd FileType verilog setlocal dictionary+=~/.vim/dict/php.dict
	autocmd FileType verilog setlocal omnifunc=phpcomplete#CompletePHP
augroup END

