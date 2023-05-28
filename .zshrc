export PATH="/home/user/code/py_texteditor:$PATH"
alias vim="nvim"
alias ls="lsd"
alias temp="watch sensors"
alias pmi="sudo pacman -S"
alias ..="cd .."

autoload -Uz vcs_info

precmd() {
  vcs_info
}

setopt PROMPT_SUBST

PS1='%n@%m %~ ${vcs_info_msg_0_}\n> '

