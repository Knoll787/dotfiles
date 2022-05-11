#!/bin/sh
numlockx &
~/pictures/.fehbg &
~/.config/dwm/status.sh &
sxhkd &
picom  --no-fading-openclose & 
sudo ntpd -qg &
wmname LG3D &
blueman-applet &
xsetwacom set 10  MapToOutput DP-2-1 &

exec dwm 

