#!/bin/sh
set -eu

# rustup completion
rustup completions zsh > ~/.zfunc/_rustup
# docker completion
curl -L https://raw.githubusercontent.com/docker/compose/1.17.0/contrib/completion/zsh/_docker-compose > ~/.zfunc/_docker-compose
