#!/bin/zsh

FILE=${PWD}/.zshrc

[ -f ~/.zshrc ] && echo "    ~/.zshrc exists already. Quitting..." && exit 0
echo "Creating symlink" && ln -s $FILE ~/.zshrc
echo "Reloading!" && source ~/.zshrc