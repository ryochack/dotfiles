"======================================================================
"    yankring.vim の設定
"======================================================================

"# Yankの履歴を管理
"# 再起動後も履歴を保持
set viminfo+=!
"# YankRing有効
let g:yankring_enabled=1
let g:yankring_max_history=20
let g:yankring_max_display=20
"# 重複した履歴は追加しない
let g:yankring_ignore_duplicate=1
"# ClipBoardをモニタリングする
let g:yankring_clipboard_monitor=1
"# '.'を置き換えない
let g:yankring_map_dot=0
"# yankring_historyファイルの場所
let g:yankring_history_dir='$HOME/.vim/temp'
"# yankring_historyファイルの名前
let g:yankring_history_file='vim_yankring_hist'

