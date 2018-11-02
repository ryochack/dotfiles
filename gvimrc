" Cursor形状の設定
set guicursor=n-v:block,i:ver20
" VisualModeで選択したテキストがクリップボードに入るようにする
set guioptions+=a

" system gvimrc設定の上書き
colorscheme solarized
set background=dark
set cmdheight=1
" 画面明滅しない
set novisualbell

" Tabと空白の色設定
highlight SpecialKey cterm=NONE ctermfg=DarkRed ctermbg=NONE guifg=Brown guibg=bg
" 行末の色設定
highlight NonText cterm=NONE ctermfg=DarkRed ctermbg=NONE guifg=Brown guibg=bg
" 行番号の色設定
highlight LineNr ctermfg=DarkGray
" カレント行の色設定。下線のみを引く。
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE

" フォント設定
set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h9

" メニューの文字化け対策
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
