
## General

# alias for `code` as the new Apple M1 processor is supported natively in the
# insider version. But typing code is faster than code-insiders.
alias code='code-insiders '

# Quick command to reload changes made here. Beats typing the tilde on a Nordic
# keyboard.
alias reload='source ~/.zshrc'


## Node - inside docker

# Features:
#   - container is removed after use
#   - current working directory is passed to /app
#   - using the long-term support version of node

alias node='docker run --rm -it -v `pwd`:/app -w /app node:lts node '
alias npm='docker run --rm -it -p 3000:3000 -v `pwd`:/app -w /app node:lts npm '
alias npx='docker run --rm -it -v `pwd`:/app -w /app node:lts npx '

# Also variants for running the latest node version.
alias node-latest='docker run --rm -it -v `pwd`:/app -w /app node:latest node '
alias npm-latest='docker run --rm -it -p 3000:3000  -v `pwd`:/app -w /app node:latest npm '
alias npx-latest='docker run --rm -it -v `pwd`:/app -w /app node:latest npx '

# Quick combo for dropping all node & repulling them.
function reinstall-node() {
    docker rmi node
    docker pull node:latest
    docker pull node:lts
}

# PHP - wip
alias php='docker run --rm -v `pwd`:/app -w /app php php '
alias composer='docker run --rm -it -v `pwd`:/app -w /app composer:latest composer '
alias c='composer '


# SSH-Agent
export SSH_AUTH_SOCK=/Users/mirorauhala/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

