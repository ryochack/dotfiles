"======================================================================
"    neobundle の設定
" -------------------------------------------------------------------- 
"  <install>
"   $ git clone git://github.com/Shougo/neobundle.vim.git
" -------------------------------------------------------------------- 
"  <command>
"   :NeoBundleInstall[!]           # Install ([!]付けるとInstall or Update)
"   :NeoBundles $plugin_name       # Pluginを検索してから直接Install (curl必要)
"   :NeoBundleSearch $plugin_name  # Pluginを検索
"   :NeoBundleClean                # 使用していないPluginを削除
"======================================================================

filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/automatic/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/automatic'))
endif


"******************************************
"*     neobundle で管理するプラグイン     *
"******************************************
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

"----- github Plugins -----

"# [ pathogen ] NeoBundle管理外の自前インストールプラグインはPathogenで管理する
NeoBundle 'git://github.com/tpope/vim-pathogen.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-pathogen'))
	call pathogen#infect('~/.vim/bundle/manual')
endif

"# [ smartchr ]
NeoBundle 'git://github.com/kana/vim-smartchr.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-smartchr'))
	if filereadable(expand('~/.vim/source/conf_smartchr.vim'))
		source ~/.vim/source/conf_smartchr.vim
	endif
endif

"# [ vimproc ]
NeoBundle 'git://github.com/Shougo/vimproc.git'
"$ make -f make_gcc.mak    # <- how to build

"# [ unite ]
NeoBundle 'git://github.com/Shougo/unite.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/unite.vim'))
	if filereadable(expand('~/.vim/source/conf_unite.vim'))
		source ~/.vim/source/conf_unite.vim
	endif
endif
"#--- Unite-Source Information ---
"# [ unite-help ]
NeoBundle 'git://github.com/tsukkee/unite-help.git'
"# [ unite-tag ]
NeoBundle 'git://github.com/tsukkee/unite-tag.git'
"# [ unite-outline ]
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
"# [ unite-mark ]
NeoBundle 'git://github.com/tacroe/unite-mark.git'
"# [ unite-script ]
NeoBundle 'git://github.com/hakobe/unite-script.git'
"# [ unite-history ]
NeoBundle 'git://github.com/thinca/vim-unite-history.git'
"# [ unite-qf ]
NeoBundle 'git://github.com/sgur/unite-qf.git'
"# [ unite-launch ]
NeoBundle 'git://github.com/ujihisa/unite-launch.git'
if isdirectory(expand('~/.vim/bundle/automatic/unite.vim'))
	if filereadable(expand('~/.vim/source/conf_unite_source.vim'))
		source ~/.vim/source/conf_unite_source.vim
	endif
endif

"# [ neocomplcache ]
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
if isdirectory(expand('~/.vim/bundle/automatic/neocomplcache'))
	if filereadable(expand('~/.vim/source/conf_neocomplcache.vim'))
		source ~/.vim/source/conf_neocomplcache.vim
	endif
endif

"# [ vimfiler ]
NeoBundle 'git://github.com/Shougo/vimfiler.git'
if isdirectory(expand('~/.vim/bundle/automatic/vimfiler'))
	if filereadable(expand('~/.vim/source/conf_vimfiler.vim'))
		source ~/.vim/source/conf_vimfiler.vim
	endif
endif

"# [ quickrun ]
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-quickrun'))
	if filereadable(expand('~/.vim/source/conf_quickrun.vim'))
		source ~/.vim/source/conf_quickrun.vim
	endif
endif

"# [ ref ]    # w3m 必要
NeoBundle 'git://github.com/thinca/vim-ref.git'

"# [ qfreplace ]    # QuickFix内で編集
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'

"# [ eskk ]
NeoBundle 'git://github.com/tyru/eskk.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/eskk.vim'))
	if filereadable(expand('~/.vim/source/conf_eskk.vim'))
		source ~/.vim/source/conf_eskk.vim
	endif
endif

"# [ surround ]
NeoBundle 'git://github.com/tpope/vim-surround.git'

"# [ vim-fugitive ]    # VimからGitを使う
NeoBundle 'git://github.com/tpope/vim-fugitive.git'

"# [ Gist ]    # VimからGistを使う
NeoBundle 'git://github.com/mattn/gist-vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/gist-vim'))
	if filereadable(expand('~/.vim/source/conf_gist.vim'))
		source ~/.vim/source/conf_gist.vim
	endif
endif

"# [ BlockDiff ]
NeoBundle 'git://github.com/vim-scripts/BlockDiff.git'

"# [ easymotion ]    # 単語移動を楽にする
NeoBundle 'git://github.com/Lokaltog/vim-easymotion.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-easymotion'))
	if filereadable(expand('~/.vim/source/conf_easymotion.vim'))
		source ~/.vim/source/conf_easymotion.vim
	endif
endif

"# [ eregex ]    # Perl/Rubyの正規表現を使う
NeoBundle 'git://github.com/othree/eregex.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/eregex.vim'))
	if filereadable(expand('~/.vim/source/conf_eregex.vim'))
		source ~/.vim/source/conf_eregex.vim
	endif
endif

"# [ alignta ]    # マルチバイト文字対応Align
NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-alignta'))
	if filereadable(expand('~/.vim/source/conf_alignta.vim'))
		source ~/.vim/source/conf_alignta.vim
	endif
endif

"# [ quickhl ]    # 気軽に複数ハイライト
NeoBundle 'git://github.com/t9md/vim-quickhl.git'

"# [ foldtext ]    # 折りたたみ行の表示をいい感じに
NeoBundle 'git://github.com/t9md/vim-foldtext.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-foldtext'))
	if filereadable(expand('~/.vim/source/conf_foldtext.vim'))
		source ~/.vim/source/conf_foldtext.vim
	endif
endif

"# [ taglist ]
NeoBundle 'git://github.com/vim-scripts/taglist.vim.git'

"# [ bufexplorer ]
NeoBundle 'git://github.com/vim-scripts/bufexplorer.zip.git'
if isdirectory(expand('~/.vim/bundle/automatic/bufexplorer.zip'))
	if filereadable(expand('~/.vim/source/conf_bufexplorer.vim'))
		source ~/.vim/source/conf_bufexplorer.vim
	endif
endif

"# [ grep ]
NeoBundle 'git://github.com/vim-scripts/grep.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/grep.vim'))
	if filereadable(expand('~/.vim/source/conf_grep.vim'))
		source ~/.vim/source/conf_grep.vim
	endif
endif

"# [ gtags ]    # GNU Global
NeoBundle 'git://github.com/vim-scripts/gtags.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/gtags.vim'))
	if filereadable(expand('~/.vim/source/conf_gtags.vim'))
		source ~/.vim/source/conf_gtags.vim
	endif
endif

"# [ DirDiff ]    # "diff"必要
NeoBundle 'git://github.com/vim-scripts/DirDiff.vim.git'

"# [ visualstar ]    # VisualMode選択されているTextを検索
NeoBundle 'git://github.com/thinca/vim-visualstar.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-visualstar.vim'))
	if filereadable(expand('~/.vim/source/conf_visualstar.vim'))
		source ~/.vim/source/conf_visualstar.vim
	endif
endif

"# [ colorscheme:solarized ]
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
if isdirectory(expand('~/.vim/bundle/automatic/vim-colors-solarized'))
	if filereadable(expand('~/.vim/source/conf_color_solarized.vim'))
		source ~/.vim/source/conf_color_solarized.vim
	endif
endif

"# [ YankRing ]    # Yank履歴を使用する
NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/YankRing.vim'))
	if filereadable(expand('~/.vim/source/conf_yankring.vim'))
		source ~/.vim/source/conf_yankring.vim
	endif
endif

"# [ ctrlp.vim ]    # 正規表現を使ったファイル検索など
NeoBundle 'git://github.com/kien/ctrlp.vim.git'
if isdirectory(expand('~/.vim/bundle/automatic/ctrlp.vim'))
	if filereadable(expand('~/.vim/source/conf_ctrlp.vim'))
		source ~/.vim/source/conf_ctrlp.vim
	endif
endif

"# [ learn-vimscript ]    # VimScript文法ヘルプ :help learn-vimscript
NeoBundle 'git://github.com/mattn/learn-vimscript.git'

"----- www.vim.org Plugins -----



"************************************
"*     手動で管理するプラグイン     *
"************************************
"# [ cmigemo ]
if isdirectory(expand('~/.vim/bundle/manual/cmigemo'))
	if filereadable(expand('~/.vim/source/conf_cmigemo.vim'))
		source ~/.vim/source/conf_cmigemo.vim
	endif
endif


filetype plugin indent on

