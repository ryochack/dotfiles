# $FreeBSD: releng/10.1/share/skel/dot.cshrc 266029 2014-05-14 15:23:06Z bdrewery $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias ls	ls -GF
alias la	ls -aF
alias lf	ls -FA
alias ll	ls -lAF


# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
# setenv	BLOCKSIZE	K
# A righteous umask
# umask 22

setenv	EDITOR	vi
setenv	PAGER	lv

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt = "%N@%m:%~ %# "
	set prompt = "%{\e[00;33m%}%~%{\e[0m%} \n[%n@%m]%# "
	set rprompt = ""
	set promptchars = "%#"

	set history = 1000
	set savehist = (1000 merge)
	set histdup = erase

	set filec
	set autolist = ambiguous
	set showdots
	set complete = enhance
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)

	set rmstar
	set notify

	if ( $?tcsh ) then
		bindkey "^w" backward-delete-word
		bindkey "^p" history-search-backward
		bindkey "^n" history-search-forward
		# ESC-b
		bindkey "^[b" vi-word-back
		# ESC-f
		bindkey "^[f" vi-word-fwd
	endif

endif

#use zsh
if (-x /usr/local/bin/zsh) then
	#exec /usr/local/bin/zsh
endif
