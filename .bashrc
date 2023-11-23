# PS1='\[\033[38;5;222m\]\u\[\033[38;5;220m\]@\[\033[38;5;75m\]\h \[\033[38;5;45m\]$(if [[ $PWD = $HOME ]]; then echo ""; else echo "\w"; fi) \[\033[38;5;226m\]$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\n\[\033[38;5;220m\]-> \[\033[0m\]'
# PS1='\e[32m\W $ \e[39m'
if [ "$TERM" = "linux" ] || [ "$TERM" = "screen" ]; then
  PS1='\u \W $ ';
else
  eval "$(starship init bash)";
fi
alias ls='ls --color=auto';
alias ll='ls --color=auto -l'
set -o vi
alias vim="nvim"
alias temp="watch sensors"
alias ..="cd .."
#export LD_LIBRARY_PATH=/usr/local/lib
#PATH=$PATH:/home/user/.cargo/bin
