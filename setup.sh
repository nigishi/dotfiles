#!/bin/bash

DOT_FILES=( .vimrc .gitconfig .gitignore .tmux.conf .dir_colors )

for file in ${DOT_FILES[*]}
do
  ln -fs `pwd`/$file $HOME/$file
done
