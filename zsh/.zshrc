autoload -Uz compinit
compinit

setopt correct
setopt extendedglob

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export MANPAGER='nvim +Man!'

PROMPT=$'[%n@%m %~]\n❯ '

export PATH=$PATH:$HOME/.local/opt/go/bin
export PATH=$PATH:$HOME/go/bin

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
