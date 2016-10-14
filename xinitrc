#!/bin/bash
xsettingsd -c ~/.xsettings &
xbindkeys &
xsetroot -solid black
emacs --daemon &
setxkbmap -option compose:lwin
setxkbmap -option ctrl:nocaps
xrdb -load ~/.Xdefaults
xrdb -merge ~/.Xdefaults
xscreensaver -no-splash &
~/.kbdremap-watch &
~/.xkbremap
~/.xkbremap-event &
feh --bg-scale ~/Development/Personal/dot-files/assets/Pulse.jpg
xset fp+ ~/.local/share/fonts/tamsyn
xset fp rehash
exec /usr/bin/i3
