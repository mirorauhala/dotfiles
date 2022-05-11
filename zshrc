autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)

## General
HIST_STAMPS="yyyy-mm-dd" # ISO-8601 all the way baby
alias reload='source ~/.zshrc'
alias edit='vim'
alias cat='bat'
alias search='fzf'
alias ls='ls --color --time-style=long-iso'
alias ll='ls -la --color --time-style=long-iso'
alias gs='git status'


# Exports
export PATH=$HOME/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export EDITOR="/usr/bin/nano"

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

sc() {
    repo=$(git config --get remote.origin.url | sed 's/:/\n/g' | sed -n 2p | rev | cut -c5- | rev)
    branch=$(git rev-parse --abbrev-ref HEAD)
    commit=$(git rev-parse origin/$branch)
    open "https://github.com/$repo/commit/$commit"   
}

## macOS differences
if [[ $OSTYPE == darwin* ]]; then

    ## coreutils 'ls' command is aliased to gls
    alias ls='gls --color=auto --time-style=long-iso'
    alias ll='gls -la --color --time-style=long-iso'

    ## iTerm integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
