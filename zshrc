autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="codespaces"

## General
HIST_STAMPS="yyyy-mm-dd" # ISO-8601 all the way baby
alias reload='source ~/.zshrc'
alias edit='vim'
alias cat='bat'
alias search='fzf'
##alias ls='ls --color --time-style=long-iso'
##alias ll='ls -la --color --time-style=long-iso'
alias gs='git status'


# Exports
export PATH=$HOME/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export EDITOR="/usr/bin/nano"
export NPM_TOKEN=""

## Helper functions

cheat() {
    curl --tlsv1.3 https://cheat.sh/$1
}

update-dotfiles() {
    cd ~/.dotfiles
    git pull
    print Reloading .zshrc
    reload
    cd ~
}

reload-env() {
    # Show env vars
    grep -v '^#' .env

    # Export env vars
    set -o allexport
    source .env
    set +o allexport

}

load-env() {
    export $(grep -v '^#' .env | xargs)
}

sc() {
    repo=$(git config --get remote.origin.url | sed 's/:/\n/g' | sed -n 2p | rev | cut -c5- | rev)
    branch=$(git rev-parse --abbrev-ref HEAD)
    commit=$(git rev-parse origin/$branch)
    open "https://github.com/$repo/commit/$commit"   
}

ubuntu() {
    docker run --rm -it ubuntu:22.04 /bin/bash
}

## macOS differences
if [[ $OSTYPE == darwin* ]]; then
    export PATH=/usr/local/bin/:$PATH
    ## coreutils 'ls' command is aliased to gls
    ##alias ls='gls --color=auto --time-style=long-iso'
    ##alias ll='gls -la --color --time-style=long-iso'

    ## iTerm integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
	
    . /usr/local/etc/profile.d/z.sh
fi

source $ZSH/oh-my-zsh.sh 

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/miro.rauhala/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
