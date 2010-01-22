# -*- mode: sh -*-
#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# http://jarod.wikidot.com/zsh-configuration

# source profile like .bashrc
if [ -f /etc/profile ]; then
  source /etc/profile
fi

# Colors

fg_black=$'\e[0;30m'
fg_red=$'\e[0;31m'
fg_green=$'\e[0;32m'
fg_brown=$'\e[0;33m'
fg_blue=$'\e[0;34m'
fg_purple=$'\e[0;35m'
fg_cyan=$'\e[0;36m'
fg_lgray=$'\e[0;37m'
fg_dgray=$'\e[1;30m'
fg_lred=$'\e[1;31m'
fg_lgreen=$'\e[1;32m'
fg_yellow=$'\e[1;33m'
fg_lblue=$'\e[1;34m'
fg_pink=$'\e[1;35m'
fg_lcyan=$'\e[1;36m'
fg_white=$'\e[1;37m'
#Text Background Colors
bg_red=$'\e[0;41m'
bg_green=$'\e[0;42m'
bg_brown=$'\e[0;43m'
bg_blue=$'\e[0;44m'
bg_purple=$'\e[0;45m'
bg_cyan=$'\e[0;46m'
bg_gray=$'\e[0;47m'
#Attributes
at_normal=$'\e[0m'
at_bold=$'\e[1m'
at_italics=$'\e[3m'
at_underl=$'\e[4m'
at_boldoff=$'\e[22m'
at_italicsoff=$'\e[23m'
at_underloff=$'\e[24m'

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

export PROMPT="[%n@%m $(basename ${PWD})]:[${fg_lcyan}%!${at_normal}]\$ "

# http://www.delodder.be/blog/debian/set-zsh-title-changing/ --
# This is used before prompt re-draw.
function preexec() {
  case $TERM in
    xterm*)
      # %~ - CWD
      # $1 - CMD
      print -Pn "\e]0;%~ - $1\a"
      ;;
  esac

  # ZSH's %~ does not shorten to the basename of the CWD, unlike Bash.
  export PROMPT="[%n@%m $(basename ${PWD})]:[${fg_lcyan}%!${at_normal}]\$ "
}

# export PROMPT="%n@%m:%~> "
# export PROMPT="${fg_lgreen}%n${fg_red}@${fg_lgreen}${at_underl}%m${fg_lgreen}${at_underloff}${fg_lgray}[${fg_lcyan}%~${fg_lgray}]${at_normal} "

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

# Do not record space-prefixed commands.
setopt hist_ignore_space

# Make sure that pastes involving tabs do not invoke completion.
zstyle ':completion:*' insert-tab pending

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path /tmp/.zsh-cache-${USER}

zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'
zstyle ':completion:*:processes' command 'ps -au${USER}'

if [ -n "${EMACS}" ]; then
  unsetopt zle
fi

if [ -z "${HOSTNAME}" ]; then
  export HOSTNAME="${HOST}"
fi

for supplement in "${HOME}/bashrc-supplements"/* ; do
  . "${supplement}"
done
