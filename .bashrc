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
alias home="cd ~"
alias nv="nvim"
alias lv="lvim"
alias code="code-oss"
alias sx="startx"
alias sxf="startxfce4"
alias net="sudo nmtui"
alias btop="bashtop"

. "$HOME/.cargo/env"

# # Emulate an MS-DOS prompt in your Linux shell.
# # Laszlo Szathmary (jabba.laci@gmail.com), 2011
# # Project home page:
# # https://ubuntuincident.wordpress.com/2011/02/08/emulate-the-ms-dos-prompt/
# #
# #
# # Modified by Soldier of Fortran
# #
# # Add to you ~/.bashrc file with: 'source ~/.themes/95/bashrc'

# function msdos_pwd
# {
#     local dir="`pwd`"

#     echo $dir | tr '/' '\\'
# }

# export PS1='C:`msdos_pwd`> '

# echo 
# echo
# echo "Microsoft(R) Windows 95"
# echo "   (C)Copyright Microsoft Corp 1981-1996."
# echo

