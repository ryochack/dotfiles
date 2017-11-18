"**********************************************************
"     KeyBinding設定
"**********************************************************
" キーマップリーダー
let mapleader = '\'
" noremap ; :
" noremap : ;

" カーソル下のキーワードをヘルプでひく
nnoremap <C-h> :<C-u>help<Space><C-r><C-w><CR>

" ZZ(保存して閉じる)とZQ(保存せずに閉じる)を無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" Spaceは何もしない
nmap <silent> <Space> <Nop>
xmap <silent> <Space> <Nop>

" 複数候補がある場合に選択してからタグジャンプ
noremap <C-]> g<C-]>

" ESC2回押しでハイライトを消す
nnoremap <ESC><ESC> :<C-u>nohlsearch<CR>

" 表示行移動
nnoremap j gj
nnoremap k gk
" 論理行移動
nnoremap gj j
nnoremap gk k

" EmacsKeyBind
lnoremap <C-a> <Home>
lnoremap <C-e> <End>

" --- QuickFix設定 ---
" QuickFixをq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>
" QuickFixリストからEnterで飛ぶ
autocmd FileType qf nnoremap <buffer> <CR> :.cc<CR>

" 無名レジスタのコピー・ペースト
noremap gy "+y
noremap gp "+p
noremap gP "+P

" Return有効
nnoremap <CR> i<CR><ESC>

" カレントディレクトリまでのパスを取得
cnoremap <C-x> <C-r>=expand("%:p:h")<CR>/

" insertモードを抜けるとIMEオフ
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" <C-p>, <C-n>でコマンド履歴を辿れるようにする
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

