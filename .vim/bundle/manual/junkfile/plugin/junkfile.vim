"========================================
"     使い捨てのファイルを作成する
"   http://vim-users.jp/2010/11/hack181/
"========================================

" Open junk file.
"{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
	"let l:junk_dir = $HOME . '/.vim/temp/.vim_junk'. strftime('/%Y/%m')
	let l:junk_dir = $HOME . '/.vim/temp/.vim_junk'
	if !isdirectory(l:junk_dir)
		call mkdir(l:junk_dir, 'p')
	endif

	let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y%m%d-%H%M%S.'))
	if l:filename != ''
		execute 'edit ' . l:filename
	endif
endfunction
"}}}
"
