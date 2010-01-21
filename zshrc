# -*- mode: sh -*-
#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# source profile like .bashrc
if [ -f /etc/profile ]; then
  source /etc/profile
fi

# User specific aliases and functions go here (override system defaults)

autoload -U compinit promptinit
autoload history-search-end
compinit
promptinit

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' format 'Attempting to complete %d'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

bindkey '^[[3~' delete-char
bindkey '^[[7~' vi-beginning-of-line
bindkey '^[[8~' vi-end-of-line

setopt correct
setopt printexitvalue
setopt hist_ignore_dups
setopt appendhistory
setopt completeinword
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

export WORDCHARS=''
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=${HOME}/.zsh_history

function precmd() {
  rehash
}

function preexec() {
  case $TERM in
    xterm*)
      # %~ - CWD
      # $1 - CMD
      print -Pn "\e]0;%~ - $1\a"
      ;;
  esac
}

export PROMPT="%n@%m:%~> "

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

export EDITOR vim

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mtp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# This allows one to CD to a target without CD.
setopt AUTO_CD

# Do not push duplicate directories onto the stack.
setopt PUSHD_MINUS

# Minimize the amount of whitespace stored.
setopt HIST_REDUCE_BLANKS

# $# for a="a b c" yield 3
setopt shwordsplit

# Complete in-word.
setopt completeinword

if [ -n "${EMACS}" ]; then
  unsetopt zle
fi

for supplement in "${HOME}/bashrc-supplements"/* ; do
  . "${supplement}"
done
