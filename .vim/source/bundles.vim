"======================================================================
"    Vundle の設定
" -------------------------------------------------------------------- 
"  <install>
"   $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" -------------------------------------------------------------------- 
"  <command>
"   :BundleInstall[!]           # Install ([!]付けるとInstall or Update)
"   :Bundles $plugin_name       # Pluginを検索してから直接Install (curl必要)
"   :BundleSearch $plugin_name  # Pluginを検索
"   :BundleClean                # 使用していないPluginを削除
"======================================================================

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"----- Vundle で管理するプラグインを書いていく -----
Bundle 'gmarik/vundle'



"----- github にあるプラグイン -----
"# [ smartchr ]
Bundle 'kana/vim-smartchr'
if isdirectory(expand('~/.vim/bundle/vim-smartchr'))
	if filereadable(expand('~/.vim/source/conf_smartchr.vim'))
		source ~/.vim/source/conf_smartchr.vim
	endif
endif

"# [ vimproc ]
Bundle 'Shougo/vimproc'
  "$ make -f make_gcc.mak    # <- how to build

"# [ unite ]
Bundle 'Shougo/unite.vim'
if isdirectory(expand('~/.vim/bundle/unite.vim'))
	if filereadable(expand('~/.vim/source/conf_unite.vim'))
		source ~/.vim/source/conf_unite.vim
	endif
endif
"#--- Unite-Source Information ---
"# [ unite-help ]
Bundle 'tsukkee/unite-help'
"# [ unite-tag ]
Bundle 'tsukkee/unite-tag'
"# [ unite-outline ]
Bundle 'h1mesuke/unite-outline'
"# [ unite-mark ]
Bundle 'tacroe/unite-mark'
"# [ unite-script ]
Bundle 'hakobe/unite-script'
"# [ unite-history ]
Bundle 'thinca/vim-unite-history'
"# [ unite-qf ]
Bundle 'sgur/unite-qf'
"# [ unite-launch ]
Bundle 'ujihisa/unite-launch'
if isdirectory(expand('~/.vim/bundle/unite.vim'))
	if filereadable(expand('~/.vim/source/conf_unite_source.vim'))
		source ~/.vim/source/conf_unite_source.vim
	endif
endif

"# [ neocomplcache ]
Bundle 'Shougo/neocomplcache'
if isdirectory(expand('~/.vim/bundle/neocomplcache'))
	if filereadable(expand('~/.vim/source/conf_neocomplcache.vim'))
		source ~/.vim/source/conf_neocomplcache.vim
	endif
endif

"# [ vimfiler ]
Bundle 'Shougo/vimfiler'
if isdirectory(expand('~/.vim/bundle/vimfiler'))
	if filereadable(expand('~/.vim/source/conf_vimfiler.vim'))
		source ~/.vim/source/conf_vimfiler.vim
	endif
endif

"# [ quickrun ]
Bundle 'thinca/vim-quickrun'
if isdirectory(expand('~/.vim/bundle/vim-quickrun'))
	if filereadable(expand('~/.vim/source/conf_quickrun.vim'))
		source ~/.vim/source/conf_quickrun.vim
	endif
endif

"# [ ref ]    # w3m 必要
Bundle 'thinca/vim-ref'

"# [ qfreplace ]    # QuickFix内で編集
Bundle 'thinca/vim-qfreplace'

"# [ eskk ]
Bundle 'tyru/eskk.vim'
if isdirectory(expand('~/.vim/bundle/eskk.vim'))
	if filereadable(expand('~/.vim/source/conf_eskk.vim'))
		source ~/.vim/source/conf_eskk.vim
	endif
endif

"# [ surround ]
Bundle 'tpope/vim-surround'

"# [ vim-fugitive ]
Bundle 'tpope/vim-fugitive'

"# [ BlockDiff ]
Bundle 'adie/BlockDiff'

"# [ easymotion ]    # 単語移動を楽にする
Bundle 'Lokaltog/vim-easymotion'
if isdirectory(expand('~/.vim/bundle/vim-easymotion'))
	if filereadable(expand('~/.vim/source/conf_easymotion.vim'))
		source ~/.vim/source/conf_easymotion.vim
	endif
endif

"# [ eregex ]    # Perl/Rubyの正規表現を使う
Bundle 'othree/eregex.vim'
if isdirectory(expand('~/.vim/bundle/eregex.vim'))
	if filereadable(expand('~/.vim/source/conf_eregex.vim'))
		source ~/.vim/source/conf_eregex.vim
	endif
endif

"# [ alignta ]    # マルチバイト文字対応Align
Bundle 'h1mesuke/vim-alignta'
if isdirectory(expand('~/.vim/bundle/vim-alignta'))
	if filereadable(expand('~/.vim/source/conf_alignta.vim'))
		source ~/.vim/source/conf_alignta.vim
	endif
endif

"# [ quickhl ]    # 気軽に複数ハイライト
Bundle 't9md/vim-quickhl'

"# [ foldtext ]    # 折りたたみ行の表示をいい感じに
Bundle 't9md/vim-foldtext'
if isdirectory(expand('~/.vim/bundle/vim-foldtext'))
	if filereadable(expand('~/.vim/source/conf_foldtext.vim'))
		source ~/.vim/source/conf_foldtext.vim
	endif
endif

"# [ taglist ]
Bundle 'vim-scripts/taglist.vim'

"# [ bufexplorer ]
Bundle 'vim-scripts/bufexplorer.zip'
if isdirectory(expand('~/.vim/bundle/bufexplorer.zip'))
	if filereadable(expand('~/.vim/source/conf_bufexplorer.vim'))
		source ~/.vim/source/conf_bufexplorer.vim
	endif
endif

"# [ grep ]
Bundle 'vim-scripts/grep.vim'
if isdirectory(expand('~/.vim/bundle/grep.vim'))
	if filereadable(expand('~/.vim/source/conf_grep.vim'))
		source ~/.vim/source/conf_grep.vim
	endif
endif

"# [ gtags ]
Bundle 'vim-scripts/gtags.vim'
if isdirectory(expand('~/.vim/bundle/gtags.vim'))
	if filereadable(expand('~/.vim/source/conf_gtags.vim'))
		source ~/.vim/source/conf_gtags.vim
	endif
endif

"# [ DirDiff ]    # "diff"必要
Bundle 'vim-scripts/DirDiff.vim'

"# [ visualstar ]    # VisualMode選択Textを検索
Bundle 'vim-scripts/visualstar.vim'
if isdirectory(expand('~/.vim/bundle/visualstar.vim'))
	if filereadable(expand('~/.vim/source/conf_visualstar.vim'))
		source ~/.vim/source/conf_visualstar.vim
	endif
endif

"# [ colorscheme:solarized ]
Bundle "altercation/vim-colors-solarized"
if isdirectory(expand('~/.vim/bundle/vim-colors-solarized'))
	if filereadable(expand('~/.vim/source/conf_color_solarized.vim'))
		source ~/.vim/source/conf_color_solarized.vim
	endif
endif


"----- www.vim.org にあるプラグイン -----
"# [ YankRing ]
Bundle 'YankRing.vim'
if isdirectory(expand('~/.vim/bundle/YankRing.vim'))
	if filereadable(expand('~/.vim/source/conf_yankring.vim'))
		source ~/.vim/source/conf_yankring.vim
	endif
endif



filetype plugin indent on

