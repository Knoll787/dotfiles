#!/bin/sh
numlockx &
~/pictures/.fehbg &
~/.config/dwm/status.sh &
sxhkd &
picom  --no-fading-openclose & 

exec dwm
