#!/usr/local/bin/zsh

DOT_FILES=( .zshrc .gitconfig .gitignore .vimrc )

for file in ${DOT_FILES[*]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done