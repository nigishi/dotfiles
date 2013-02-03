#!/usr/bin/env zsh

DOT_FILES=( .zshrc .zshenv .zshrc.alias .zshrc.osx .vimrc .vimrc.basic .vimrc.bundle .vimrc.clors .vimrc.fuf .vimrc.statusline .gitconfig .gitignore .tmux.conf .dir_colors )

for file in ${DOT_FILES[*]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
