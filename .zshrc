# === System ===
setopt nobeep                   # BEEP音を鳴らさない
setopt nolistbeep               # 曖昧な補完時にBEEP音を鳴らさない


# === Utility ===
setopt auto_cd                  # コマンドがディレクトリ名の時にcd
setopt nocorrect                # コマンドのスペル訂正を試みる
setopt nocorrect_all            # 全引数にスペル訂正を試みる
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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # 補完時に大文字小文字を区別しない

# === Alias Setting ===
case "${OSTYPE}" in
	freebsd*|darwin*)
		alias ls="ls -F"
		;;
	linux*)
		alias ls="ls -F --color=auto"
		;;
esac
alias la="ls -a"
alias ll="ls -alF"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tmux='tmux -2'
alias g='git'

alias screenlock='i3lock -e -c 000000'
alias browser='chromium'

# Global Alias
alias -g C="| cat"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| egrep"
alias -g V="| vim -"
alias -g R="| vim -R -"

# http://qiita.com/uchiko/items/f6b1528d7362c9310da0
function peco-select-history() {
	local tac
	if which tac > /dev/null; then
		tac="tac"
	else
		tac="tail -r"
	fi
	BUFFER=$(\history -n 1 | \
		eval $tac | \
		peco --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# === Load Additional Setting File ===
# [ -f ~/.profile ] && source ~/.profile

# zplug

source ~/.zplugrc

fpath+=~/.dotfiles/.zfunc

