#!/bin/sh
numlockx &
~/pictures/backgrounds/.fehbg &
~/.config/dwm/status.sh &
sxhkd &
picom  --no-fading-openclose & 

exec dwm
