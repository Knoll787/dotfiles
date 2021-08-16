export ZSH="$HOME/.oh-my-zsh"

# Theme
export TERM=xterm-256color
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="dd/mm/yyyy"

#Plugins
plugins=(
  git
  archlinux
)

source $ZSH/oh-my-zsh.sh

#Default Applications
export EDITOR="/usr/bin/vim"

#Aliases
alias shutdown='shutdown -h now'
alias notes='brave ~/documents/notes/notes_html/index.html'
alias brightness='sudoedit /sys/class/backlight/intel_backlight/brightness'
alias dock='./dotfiles/arandr/dock.sh && ./pictures/.fehbg'
alias open='xdg-open'
alias ls='ls --color -h --group-directories-first'
alias ltspice="wine /home/nwoods/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx86.exe"
alias vi="vim"
alias zathura="devour zathura"
alias evince="devour evince"
alias chromium="devour chromium"
alias feh="devour feh"
alias feh="devour wine"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -v
