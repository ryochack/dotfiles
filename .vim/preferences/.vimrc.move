"**********************************************************
"     移動設定 Move
"**********************************************************
" 上下最低3行を残してスクロール
set scrolloff=3
" 左右最低3文字を残してスクロール
set sidescrolloff=3
" 矩形選択で自由に移動する
set virtualedit+=block

" Display行移動
nnoremap j gj
nnoremap k gk
" 論理行移動
nnoremap gj j
nnoremap gk k

" EmacsKeyBind
noremap <C-a> <Home>
noremap <C-e> <End>
lnoremap <C-a> <Home>
lnoremap <C-e> <End>

" インサートモードでもhjklで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ()[]までの選択を効率的にする
vnoremap ( t(
vnoremap ) t)
vnoremap [ t[
vnoremap ] t]

onoremap ( t(
onoremap ) t)
onoremap [ t[
onoremap ] t]

" Tab移動
noremap <silent> <C-F11> :<C-u>tabp<CR>
noremap <silent> <C-F12> :<C-u>tabn<CR>

