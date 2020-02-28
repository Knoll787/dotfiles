autoload -Uz compinit promptinit
compinit
promptinit

PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '

export TERM=xterm-256color
cd ~/

#Aliases
alias shutdown='shutdown -h now'
alias notes='brave ~/documents/notes/notes_html/index.html'
alias brightness='sudo vim /sys/class/backlight/intel_backlight/brightness'
