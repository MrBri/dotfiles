# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/t4b0/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle wbinglee/zsh-wakatime
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme https://github.com/sbugzu/gruvbox-zsh.git gruvbox

antigen apply
