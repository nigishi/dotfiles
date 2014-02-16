#!/usr/bin/env zsh

DOT_FILES=( .zshrc .zshrc.alias .zshrc.osx .zshrc.linux .vimrc .gitconfig .gitignore .tmux.conf .dir_colors )

for file in ${DOT_FILES[*]}
do
  ln -fs `pwd`/$file $HOME/$file
done
