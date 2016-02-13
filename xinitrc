#!/bin/bash
xsettingsd -c ~/.xsettings &
xbindkeys &
xsetroot -solid black
setxkbmap -option compose:lwin
setxkbmap -option ctrl:nocaps
xrdb -load ~/.Xdefaults || xrdb -merge ~/.Xdefaults
xscreensaver -no-splash &
/usr/local/google/home/mtp/.kbdremap-watch &
~/.xkbremap
~/.xkbremap-event &
feh --bg-scale ~/Development/Personal/dot-files/assets/Pulse.jpg
xset fp+ ~/.local/share/fonts/tamsyn
xset fp rehash
exec /usr/bin/i3

