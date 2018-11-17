#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth
export HISTIGNORE=ls:exit:history:which
export HISTSIZE=4000
export HISTFILESIZE=8000

# erase by Ctrl-W to slash
stty werase undef
bind '\C-w:unix-filename-rubout'

# enable completion when sudo
complete -cf sudo

alias ls='ls --color=auto -F'
alias ll='ls -alF'
alias la='ls -AF'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias g='git'

PS1='[\u@\h \W]\$ '

# peco setting
if type peco > /dev/null 2>&1; then
	peco_history() {
		#declare l=$(HISTTIMEFORMAT=  history | LC_ALL=C sort -r |  awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'   |  peco --query "$READLINE_LINE")
		local l=$(HISTTIMEFORMAT= history | cut -d" " -f4- | tac | sed -e 's/^\s*[0-9]*    \+\s\+//' | peco --query "$READLINE_LINE")
		READLINE_LINE="$l"
		READLINE_POINT=${#l}
	}
	bind -x '"\C-r": peco_history'
fi

# git completion
if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
fi

# rustup completion
if type rustup > /dev/null 2>&1; then
	if [ ! -f $HOME/.config/bash/rustup-completion.bash ]; then
		install -d $HOME/.config/bash
		rustup completions bash > $HOME/.config/bash/rustup-completion.bash
	fi
	source $HOME/.config/bash/rustup-completion.bash
fi

source $HOME/.profile

