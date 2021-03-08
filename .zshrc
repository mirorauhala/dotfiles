
# General
alias code='code-insiders '
alias reload='source ~/.zshrc'


# Node
alias node='docker run --rm -it -v `pwd`:/app -w /app node:lts node '
alias npm='docker run --rm -it -p 3000:3000 -v `pwd`:/app -w /app node:lts npm '
alias npx='docker run --rm -it -v `pwd`:/app -w /app node:lts npx '

alias node-latest='docker run --rm -it -v `pwd`:/app -w /app node:latest node '
alias npm-latest='docker run --rm -it -p 3000:3000  -v `pwd`:/app -w /app node:latest npm '
alias npx-latest='docker run --rm -it -v `pwd`:/app -w /app node:latest npx '

function reinstall-node() {
    docker rmi node
    docker pull node:latest
    docker pull node:lts
}

# PHP
alias php='docker run --rm '
alias composer='docker run --rm -it -v `pwd`:/app -w /app composer:latest composer '
alias c='composer '


# SSH-Agent
export SSH_AUTH_SOCK=/Users/mirorauhala/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

