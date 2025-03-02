PS1='\[\033[38;5;15m\]\u\[\033[38;5;11m\]@\[\033[38;5;13m\]\h \[\033[38;5;6m\]\w \[\033[38;5;14m\]$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\n\[\033[38;5;11m\]-> \[\033[0m\]'

alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -l'
alias lla='ls --color=auto -l -A'
alias temp="watch sensors"
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias up="yay -Syu"
alias ins="yay -S"

alias mountme="sudo mount -o uid=1000,gid=1000,fmask=0111,dmask=0000"
alias gitgra="git log --oneline --graph --color"
alias e="nvim"
alias vim="nvim"
alias mc='function _mc() { mkdir -p "$1" && cd "$1"; }; _mc'
alias tput='trash-put'

set -o vi
#export LD_LIBRARY_PATH=/usr/local/lib
PATH=$PATH:/home/user/.cargo/bin
PATH=$PATH:/home/user/.local/bin

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
