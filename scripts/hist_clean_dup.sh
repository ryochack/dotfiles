#!/usr/bin/env sh
set -eu

tac ~/.bash_history | awk '!a[$0]++' | tac > ~/.bash_history.tmp
mv ~/.bash_history{.tmp,}

