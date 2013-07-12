#!/bin/sh

xsetroot -cursor_name left_ptr
setxkbmap -option ctrl:swapcaps
xset r rate 180 50
xset -b
unclutter &

xmodmap ~/.Xmodmap

xrdb -merge ~/.Xresources

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#xmonad
exec /usr/bin/i3
