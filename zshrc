#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# source profile like .bashrc
if [ -f /etc/profile ]; then
  source /etc/profile
fi

# Set default printer on googleedu*.corp.google.com workstations
#  in Cairo conference room in Mountain View for new hire orientation

if [ "$(echo $HOSTNAME | cut -c 1-9)" = "googleedu" ]
then
  export PRINTER=hpcairo
  export LPDEST=$PRINTER
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
      print -Pn "\e]0;$*\a"
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
