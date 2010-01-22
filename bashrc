# -*- mode: sh -*-
#
# .bashrc

_ZSH=$(which zsh)

if [ -x "${_ZSH}" ]; then
  exec "${_ZSH}"
fi

unset _ZSH

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

for supplement in "${HOME}/bashrc-supplements"/* ; do
 . "${supplement}"
done

# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
# export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export HISTSIZE=1000
export HISTFILESIZE=1000
export CVS_RSH=ssh
export PATH="${HOME}/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/lib:${LD_LIBRARY_PATH}"
