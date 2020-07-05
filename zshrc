#!/bin/bash

USERNAME=koketani

# default bashrc
## For Linux
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc
## For Darwin
[[ -f /etc/bashrc ]] && source /etc/bashrc

# vi mode in bash
set -o vi

# include local bin path
export PATH="$PATH":/usr/local/bin

# default editor
export EDITOR=vim

# tmux
alias tmux='tmux -u'

# for mac
# overwrite posix commands with gnu's ones
command -v gsed > /dev/null 2>&1 && alias sed='gsed'
command -v ggrep > /dev/null 2>&1 && alias grep='ggrep'

# dev
DEV="$HOME/Developments"
export DEV

# cpp for make command and make built-in plugin in vim
export CXX="clang++"
export CXXFLAGS="-std=c++14 -Wall -Wextra -O2"
# export LDFLAGS

# pipenv
export PIPENV_IGNORE_VIRTUALENVS=1

# ghq
export GHQ_ROOT="$HOME"/Developments/git

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# git completion and git prompt
[[ -f "$HOME"/.git-completion.bash ]] && source "$HOME"/.git-completion.bash
[[ -f "$HOME"/.git-prompt.sh ]] && source "$HOME"/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
export PROMPT_COMMAND='__git_ps1 "\[\033[01;34m\]$USERNAME\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]" "\\\$ "'

# java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$PATH":/opt/maven/bin

# base16 shell
BASE16_SHELL="$HOME"/.config/base16-shell/
[[ -n "$PS1" ]] && [[ -f "$BASE16_SHELL"/profile_helper.sh ]] && eval "$("$BASE16_SHELL"/profile_helper.sh)"

# nvm
export NVM_DIR="$HOME"/.nvm
[ -s "$NVM_DIR"/nvm.sh  ] && \. "$NVM_DIR"/nvm.sh  # This loads nvm
[ -s "$NVM_DIR"/bash_completion  ] && \. "$NVM_DIR"/bash_completion  # This loads nvm bash_completion

# npm
export PATH="$HOME"/.npm-global/bin:"$PATH"

# llvm
export PATH=/usr/local/opt/llvm/bin:"$PATH"

# bash completion
# $(brew --prefix)/etc/bash_completion.d
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && source /usr/local/etc/profile.d/bash_completion.sh

# fzf
[[ -f "$HOME"/.fzf.bash ]] && source "$HOME"/.fzf.bash

# google cloud sdk
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
[[ -f /usr/local/Caskroom/google-cloud-sdk ]] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc

# asdf
[[ -f "$HOME"/.asdf/asdf.sh ]] && source "$HOME"/.asdf/asdf.sh
[[ -f "$HOME"/.asdf/completions/asdf.bash ]] && source "$HOME"/.asdf/completions/asdf.bash

# golang
GOPATH=$(go env GOPATH)
export GOPATH
export PATH="$PATH":"$GOPATH"/bin

# pip
export PIP_REQUIRE_VIRTUALENV=true

# pipx
export PATH="$PATH":"$HOME"/.pipx/bin

# venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# direnv
eval "$(direnv hook bash)"

# pass
[[ -r "/usr/local/etc/bash_completion.d/pass"  ]] && source "/usr/local/etc/bash_completion.d/pass"
