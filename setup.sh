#!/usr/bin/env zsh

DOT_FILES=( .zshrc .zshrc.alias .vimrc .gitconfig .gitignore .tmux.conf .dir_colors )

for file in ${DOT_FILES[*]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
