source ~/.dotfiles/.submodules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme lazopm/odin odin

antigen apply

alias v='nvim'
alias vim='nvim'
alias nvim='nvim'
alias groot='cd $(git rev-parse --show-toplevel)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.linuxbrew/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  . "/home/lazop/.linuxbrew/opt/nvm/nvm.sh"
ulimit -n 2048
