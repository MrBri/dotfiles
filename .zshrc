# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias git=hub

source /usr/local/opt/asdf/asdf.sh
source /usr/local/share/antigen/antigen.zsh

export PATH=~/.local/bin:$PATH      # awscli, and other pips?
export PATH="/usr/local/sbin:$PATH" # Homebrew

export TERM="xterm-256color-italic"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-case"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle wbinglee/zsh-wakatime
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme https://github.com/sbugzu/gruvbox-zsh.git gruvbox

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# bindkey '\UF700' history-substring-search-up
# bindkey '\UF701' history-substring-search-down
# bindkey '${terminfo[kcuu1]}' history-substring-search-up
# bindkey '${terminfo[kcud1]}' history-substring-search-down

