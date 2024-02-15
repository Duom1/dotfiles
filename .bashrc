PS1='\[\033[38;5;222m\]\u\[\033[38;5;220m\]@\[\033[38;5;75m\]\h \[\033[38;5;45m\]\w \[\033[38;5;226m\]$(git rev-parse --abbrev-ref HEAD 2>/dev/null)\n\[\033[38;5;220m\]-> \[\033[0m\]'
alias ls='ls --color=auto';
alias ll='ls --color=auto -l'
set -o vi
alias temp="watch sensors"
alias ..="cd .."
#export LD_LIBRARY_PATH=/usr/local/lib
eval "$(zoxide init --cmd cd bash)"
PATH=$PATH:/home/user/.cargo/bin
PATH=$PATH:/home/user/.local/bin
