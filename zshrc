source ~/.dotfiles/.submodules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme lazopm/odin odin

antigen apply

alias v='nvim'
alias vim='nvim'
alias groot='cd $(git rev-parse --show-toplevel)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ulimit -n 2048

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
