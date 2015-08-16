#!/bin/sh

touch ~/.agent
chmod 0700 ~/.agent
gpg-agent --daemon -s --scdaemon-program /usr/libexec/scdaemon --enable-ssh-support > ~/.agent
. ~/.agent
xsettingsd -c ~/.xsettingsd &
xbindkeys &
xsetroot -solid black
emacs --daemon &
setxkbmap -option compose:lwin
setxkbmap -option ctrl:nocaps
xrdb ~/.Xdefaults
xscreensaver -no-splash &
exec /usr/local/bin/i3
