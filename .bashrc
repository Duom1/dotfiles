# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\w $ '

alias ls='ls --color=auto'
alias la="ls --color=auto -a"
alias rm="rm -i"
alias ..="cd .."
alias xi="sudo xbps-install"
alias ins="sudo make clean install"
alias com-d="bash ~/.sources/desktop/dotfiles/compile.sh"
alias rb="sudo reboot"
alias po="sudo poweroff"
alias clip="xclip -sel c <"
alias n="ping gnu.org"
alias wall="wal -n -e -i"
alias his="cat ~/.bash_history | grep"
alias nv="nvim"
alias lv="lvim"
alias code="code-oss"
alias sx="startx"
alias sxf="startxfce4"
alias net="sudo nmtui"
alias btop="bashtop"

. "$HOME/.cargo/env"

export FZF_DEFAULT_COMMAND="find -L"
