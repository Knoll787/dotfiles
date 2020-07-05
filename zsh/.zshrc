export ZSH="/home/nwoods/dotfiles/oh-my-zsh"
export FZF_BASE="/home/nwoods/dotfiles/oh-my-zsh/plugins/fzf"

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
alias open='xdg-open'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
