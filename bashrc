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

# prompt
## color definitions
TXTBLK='\e[0;30m' # Black - Regular
TXTRED='\e[0;31m' # Red
TXTGRN='\e[0;32m' # Green
TXTYLW='\e[0;33m' # Yellow
TXTBLU='\e[0;34m' # Blue
TXTPUR='\e[0;35m' # Purple
TXTCYN='\e[0;36m' # Cyan
TXTWHT='\e[0;37m' # White
BLDBLK='\e[1;30m' # Black - Bold
BLDRED='\e[1;31m' # Red
BLDGRN='\e[1;32m' # Green
BLDYLW='\e[1;33m' # Yellow
BLDBLU='\e[1;34m' # Blue
BLDPUR='\e[1;35m' # Purple
BLDCYN='\e[1;36m' # Cyan
BLDWHT='\e[1;37m' # White
UNKBLK='\e[4;30m' # Black - Underline
UNDRED='\e[4;31m' # Red
UNDGRN='\e[4;32m' # Green
UNDYLW='\e[4;33m' # Yellow
UNDBLU='\e[4;34m' # Blue
UNDPUR='\e[4;35m' # Purple
UNDCYN='\e[4;36m' # Cyan
UNDWHT='\e[4;37m' # White
BAKBLK='\e[40m'   # Black - Background
BAKRED='\e[41m'   # Red
BAKGRN='\e[42m'   # Green
BAKYLW='\e[43m'   # Yellow
BAKBLU='\e[44m'   # Blue
BAKPUR='\e[45m'   # Purple
BAKCYN='\e[46m'   # Cyan
BAKWHT='\e[47m'   # White
TXTRST='\e[0m'    # Text Reset
## \w setting (how many directories do you show?)
PROMPT_DIRTRIM=2
## prompt setting
PS1="${TXTGRN}\u@\h:\w\$${TXTRST} "

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

