#!/bin/sh
numlockx &
~/.fehbg &
~/.config/dwm/status.sh &
sxhkd &

exec dwm
