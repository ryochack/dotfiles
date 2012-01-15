"======================================================================
"    quickrun.vim の設定
"======================================================================

" launch quickrun : <Leader>r

"# 実行設定[runner]:vimprocでの非同期実行をデフォルトにする
"# 出力設定[outputter]:出力Bufferを開く
let g:quickrun_config = {
\   '_': {
\     'runner': 'vimploc',
\     'outputter': 'buffer', 
\   },
\}

"# GOのコンパイル・リンク・実行まで一気に行う
let g:quickrun_config = {
\   'go': { 'command': '8g',
\           'exec': ['8g %s', '8l -o %s:p:r %s:p:r.8', '%s:p:r %a', 'rm -f %s:p:r']
\    }
\}

