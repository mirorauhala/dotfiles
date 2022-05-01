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
}

## macOS differences
if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then

    ## coreutils 'ls' command is aliased to gls
    alias ls='gls --color=auto --time-style=long-iso'
    alias ll='gls -la --color --time-style=long-iso'

    ## iTerm integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

fi