source ~/.dotfiles/.submodules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme tylerreckart/odin odin

antigen apply
