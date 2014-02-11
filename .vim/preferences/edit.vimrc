"**********************************************************
"     編集設定 Edit
"**********************************************************
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

" 無名レジスタのコピー・ペースト
noremap gy "*y
noremap gp "*p
noremap gP "*P

" Return有効
nnoremap <CR> i<CR><ESC>

" 選択範囲のインデントを連続して変更する
vnoremap < <gv
vnoremap > >gv

" カレントディレクトリまでのパスを取得
cnoremap <C-x> <C-r>=expand("%:p:h")<CR>/

" 保存時に対象ディレクトリが存在しなければ作成する
augroup AutoMkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END


"**********************************************************
"     補完設定 Complement
"**********************************************************
" 補完候補表示を有効
set wildmenu
" コマンドライン補完候補検索開始キー
set wildchar=<TAB>
" 補完動作設定:最長マッチ
set wildmode=list:longest
" コマンド・検索パターンの履歴数
set history=100
" 補完候補の検索場所
set complete=.,w,b,u,k,t,i
" 挿入モード補完設定
set completeopt=menu,menuone,preview

filetype off
syntax off

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

filetype plugin indent on
syntax enable


