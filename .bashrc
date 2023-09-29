# PS1='\[\033[38;5;222m\]\u\[\033[38;5;220m\]@\[\033[38;5;75m\]\h \[\033[38;5;45m\]$(if [[ $PWD = $HOME ]]; then echo ""; else echo "\w"; fi) \[\033[38;5;226m\]$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\n\[\033[38;5;220m\]-> \[\033[0m\]'
# PS1='\e[32m\W $ \e[39m'
if [ "$TERM" = "linux" ]; then
  PS1='\u \W $ ';
  alias ls='ls --color'
  alias ll='ls --color -l'
else
  eval "$(starship init bash)";
  alias ls="lsd"
  alias ll="lsd -l"
fi
alias vim="nvim"
alias vim_conf="nvim ~/.config/nvim/init.lua"
alias temp="watch sensors"
alias kssh="kitty +kitten ssh"
alias ..="cd .."
export LD_LIBRARY_PATH=/usr/local/lib
