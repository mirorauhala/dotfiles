
# export PATH=$HOME/bin:/usr/local/bin:$PATH
HIST_STAMPS="yyyy-mm-dd"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

#eval "$(fnm env --use-on-cd)"
#eval "$(direnv hook zsh)"
eval "$(mise activate zsh)"
