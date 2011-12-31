#!/bin/zsh

# PATH設定は .zshenv に記述

# === System ===
setopt nobeep                   # BEEP音を鳴らさない
setopt nolistbeep               # 曖昧な補完時にBEEP音を鳴らさない
setopt print_eight_bit          # 8bit文字で表示
setopt auto_resume              # サスペンド中のプロセスと同じコマンドを実行した場合はリジューム
setopt notify                   # バックグラウンドジョブ状態の即時報告
bindkey -e                      # Emacsキーバインド
export LS_COLORS='di=01;36'     # lsの出力に色を付ける
# zsh補完時の色設定
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# === Utility ===
setopt auto_cd                  # コマンドがディレクトリ名の時にcd
setopt correct                  # コマンドのスペル訂正を試みる
setopt correct_all              # 全引数にスペル訂正を試みる
setopt multios                  # 複数のリダイレクトやパイプに対応
#setopt numeric_glob_sort        # ファイル名を数値的にソート
# 単語として認識する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


# === History ===
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096
if [ $UID = 0 ]; then           # rootのコマンドはヒストリに追加しない
    unset HISTFILE
    SAVEHIST=0
fi
# -- Command History --
setopt hist_ignore_dups         # 直前のコマンドと全く同じ場合、コマンドをhistoryリストに追加しない
setopt hist_ignore_all_dups     # historyに同一コマンドがある場合、古いものを削除
setopt hist_reduce_blanks       # history追加時に余分な空白を取り除く
setopt hist_ignore_space        # コマンドがspaceから始まる場合、コマンド行をhistoryから削除する
setopt share_history            # historyを共有
setopt append_history           # 複数のzshを使うときなどにhistoryファイルに上書きせずに追加する
# -- history Search --
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
# -- cd History --
setopt auto_pushd               # cd時に自動的にpushd
setopt pushd_ignore_dups        # 重複するディレクトリを無視


# === Complement ===
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit -u
# sudoでも補完の対象
zstyle ':completion:*:sudo:*' command-path $path   #/usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
setopt auto_list 			    # 曖昧な補完時に候補表示
setopt auto_param_keys          # 変数名に対する無駄なスペースの削除や()の補完
setopt auto_menu                # 補完候補を表示する
setopt list_types               # 補完候補を種別表示(ls -F)
setopt list_packed              # 補完リストなるべく少ない行数に
setopt complete_in_word         # 語の途中でもカーソル位置で補完
unsetopt menu_complete          # 補完時にマッチしたものをいきなり挿入しない
setopt auto_remove_slash        # 補完で末尾に補われた/を自動的に削除
# 補完で大文字小文字区別しない(大文字入力のときは区別)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt brace_ccl                # ブレース展開機能で{a-c}を{a,b,c}と解釈できるようにする
unsetopt extended_glob          # 拡張グラブを無効にする
## --- Git の HEAD^^ 対策 (extended_glob有効の副作用) ---
#typeset -A abbreviations
#abbreviations=(
#    "L"    "| $PAGER"
#    "G"    "| grep"
#    "HEAD^"     "HEAD\\^"
#    "HEAD^^"    "HEAD\\^\\^"
#    "HEAD^^^"   "HEAD\\^\\^\\^"
#    "HEAD^^^^"  "HEAD\\^\\^\\^\\^\\^"
#    "HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
#)
#magic-abbrev-expand () {
#    local MATCH
#    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9^]#}
#    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
#}
#magic-abbrev-expand-and-insert () {
#    magic-abbrev-expand
#    zle self-insert
#}
#magic-abbrev-expand-and-accept () {
#    magic-abbrev-expand
#    zle accept-line
#}
#no-magic-abbrev-expand () {
#    LBUFFER+=' '
#}
#zle -N magic-abbrev-expand
#zle -N magic-abbrev-expand-and-insert
#zle -N magic-abbrev-expand-and-accept
#zle -N no-magic-abbrev-expand
#bindkey "\r"  magic-abbrev-expand-and-accept # M-x RET はできなくなる
#bindkey "^J"  accept-line # no magic
#bindkey " "   magic-abbrev-expand-and-insert
#bindkey "."   magic-abbrev-expand-and-insert
#bindkey "^x " no-magic-abbrev-expand
## --- Git の HEAD^^ 対策 (ここまで) ---


# === Prompt Setting ===
# PROMPT
# < 色一覧 >
# 00: なにもしない
# 01: 太字化
# 04: 下線
# 05: 点滅
# 07: 前背色反転
# 08: 表示しない
# 22: ノーマル化
# 24: 下線なし
# 25: 点滅なし
# 27: 前背色反転なし
# 30: 黒(前景色)
# 31: 赤(前景色)
# 32: 緑(前景色)
# 33: 茶(前景色)
# 34: 青(前景色)
# 35: マゼンタ(前景色)
# 36: シアン(前景色)
# 37: 白(前景色)
# 39: デフォルト(前景色)
# 40: 黒(背景色)
# 41: 赤(背景色)
# 42: 緑(背景色)
# 43: 茶(背景色)
# 44: 青(背景色)
# 45: マゼンタ(背景色)
# 46: シアン(背景色)
# 47: 白(背景色)
# 49: デフォルト(背景色)

# < プロンプト表示フォーマット>
# < http://zsh.sourceforge.net/Doc/Release/zsh_12.html#SEC40 >
# %% %を表示
# %) )を表示
# %l 端末名省略形
# %M ホスト名(FQDN)
# %m ホスト名(サブドメイン)
# %n ユーザー名
# %y ユーザー端末名
# %# rootなら#、他は%を表示
# %? 直前に実行したコマンドの結果コード
# %d ワーキングディレクトリ %/ でも可
# %~ ホームディレクトリからのパス
# %h ヒストリ番号 %! でも可
# %a The observed action, i.e. "logged on" or "logged off".
# %S (%s) 反転モードの開始/終了 %S abc %s とするとabcが反転
# %U (%u) 下線モードの開始/終了 %U abc %u とするとabcに下線
# %B (%b) 強調モードの開始/終了 %B abc %b とするとabcを強調
# %t 時刻表示(12時間単位、午前/午後つき) %@ でも可
# %T 時刻表示(24時間表示)
# %* 時刻表示(24時間表示秒付き)
# %w 日表示(dd) 日本語だと 曜日 日
# %W 年月日表示(mm/dd/yy)
# %D 年月日表示(yy-mm-dd)

# PROMPT  : 左側に表示される通常のプロンプト
# PROMPT2 : 2行以上のコマンドを入力する際に表示されるプロンプト
# SPROMPT : コマンドを打ち間違えたときの確認プロンプト
# RPROMPT : 右側に表示されるプロンプト。入力が被ると自動的に消える

setopt prompt_subst             # PROMPT内で変数展開
autoload -Uz colors; colors     # PROMPTのカラー表示有効
case ${UID} in
0)  # rootだと強調表示 
PROMPT="
%B%{$fg[green]%}%~%{$reset_color%}
[%n@%M]$%b "
PROMPT2="%B%_>%b "
SPROMPT="%B%r is correct? [n,y,a,e]:%b "
;;
*)
PROMPT="
%{$fg[green]%}%~%{$reset_color%}
[%n@%M]$ "
PROMPT2="%_> "
SPROMPT="%r is correct? [n,y,a,e]: "
;;
esac


# === Alias Setting ===
setopt complete_aliases		# aliased ls needs if file/dir completions work
alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s gz=gzcat
alias -s tbz=bzcat
alias -s bz2=bzcat
alias -s java=lv
alias -s c=lv
alias -s cpp=lv
alias -s cc=lv
alias -s h=lv
alias -s C=lv
alias -s sh=lv
alias -s txt=lv
alias -s xml=lv

case "${OSTYPE}" in
	freebsd*|darwin*)
		alias ls="ls -F -G"
		;;
	linux*)
		alias ls="ls -F --color=auto"
		;;
esac

case "${OSTYPE}" in
	darwin*)
		# MacVim内包のvim7.3を参照する
		# Symlinkで駄目な理由は-> https://github.com/altercation/solarized/issues/60
		alias vim="/usr/local/Cellar/macvim/7.3-63/MacVim.app/Contents/MacOS/Vim"
		;;
esac

alias la="ls -A"
alias ll="ls -alF"
alias rm="rm -i"
alias mv="mv -i"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Global Alias
alias -g L="| lv"
alias -g H="| head"
alias -g T="| tail"
alias -g V="| vim -"
alias -g R="| vim -R -"

alias browser=chromium-browser


# === w3mでALC検索 ===
function alc() {
    if [ $# != 0 ]; then
        w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
    else
        w3m "http://www.alc.co.jp/"
    fi
}


# === Load Additional Setting File ===
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

