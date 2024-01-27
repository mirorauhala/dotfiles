
# export PATH=$HOME/bin:/usr/local/bin:$PATH
HIST_STAMPS="yyyy-mm-dd"
STOW_FOLDERS="zsh,tmux,bin"

restow() {
    pushd $DOTFILES
    for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
    do
        echo "stow $folder"
        stow -D $folder
        stow $folder
    done
    popd
}

unwip() {
  git log -1 --oneline
  echo "---------------------------------------"
  git diff --stat HEAD~1
  echo "---------------------------------------"
  git reset --soft HEAD~1
  git reset HEAD .
  echo "Changes from the last commit have been undone."
}


source ~/.zsh_profile

eval "$(fnm env --use-on-cd)"
