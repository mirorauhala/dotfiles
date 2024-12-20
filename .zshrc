
HIST_STAMPS="yyyy-mm-dd"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 90
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

eval "$(mise activate zsh)"
