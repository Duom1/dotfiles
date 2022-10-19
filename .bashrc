# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[ \w ]  '

alias ls='ls --color=auto'
alias la="ls --color=auto -a"
alias rm="rm -i"
alias ..="cd .."
alias xi="sudo xbps-install"
alias ins="sudo make clean install"
alias rb="sudo reboot"
alias po="sudo poweroff"
alias conf="nvim config.h"
