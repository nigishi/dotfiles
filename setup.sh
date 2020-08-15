#!/bin/bash

DOT_FILES=(
.vimrc
.gitconfig
.gitignore 
.tmux.conf 
)

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

for file in ${DOT_FILES[*]}
do
  ln -fs `pwd`/$file $HOME/$file
done

mkdir -p $HOME/.config/fish
ln -fs `pwd`/.fish/config.fish $HOME/.config/fish/config.fish 
