#!/bin/bash

dte(){
  dte="$(date +"%A, %B %d | 🕒 %l:%M%p")"
  echo -e "$dte"
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "🖪 $mem"
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "💻 $cpu% cpu"
}

#weather=$(curl -s "wttr.in/Branxton?format=4")
#if [[$weather =~ "Sorry" ]] then
#  weather=""
#fi

output(){
  opt="| $(cpu) | $(mem) | $(dte) |"
  echo -e "$opt"
}

while true; do
  xsetroot -name "$(output)" 
  sleep 1s 
done &

