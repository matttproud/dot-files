#!/bin/bash

set -x

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:${PATH}"

THIRD_PARTY="${HOME}/3rd-Party"
THEME_PATH="${THIRD_PARTY}/lib/gtk-2.0/2.4.0/engines"

export COLORTERM='xterm'
export PATH="${THIRD_PARTY}/bin:/home/mtp/bin:${PATH}"
export LD_LIBRARY_PATH="${THEME_PATH}:${THIRD_PARTY}/lib:${LD_LIBRARY_PATH}"
# export GTK_PATH="${THIRD_PARTY}/lib/gtk-2.0"

export XCURSOR_THEME=contrastlarge

xmodmap ~/.xmodmap

xrdb -merge ~/.Xdefaults

xscreensaver -nosplash &

if [ -x "$(which xbindkeys)" ]; then
  xbindkeys &
fi

if [ -d "/opt/ion3/bin" ]; then
  PATH="/opt/ion3/bin:${PATH}"
fi

if [ -x "$(which ion3)" ]; then
  exec $(which ion3)
elif [ -x "$(which twm)" ]; then
  exec $(which twm)
elif [ -x "$(which gnome-session)" ]; then
  exec $(which gnome-session)
fi
