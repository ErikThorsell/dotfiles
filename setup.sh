#!/usr/bin/env bash

ready="n"
while [[ $ready != 'y' ]]; do
    echo -e "\nDo your dotfiles repository reside in $HOME/dotfiles? (y/n)"
    read -n 1 ready
done;

echo "~~oo##> SETTING UP DOTFILES <##oo~~"

echo "Creating symlinks in $HOME/"
echo " $ ln -s $PWD/bash/bashrc $HOME/.bashrc"
ln -s $PWD/bash/bashrc $HOME/.bashrc
echo " $ ln -s $PWD/bash/profile $HOME/.profile"
ln -s $PWD/bash/profile $HOME/.profile
echo " $ ln -s $PWD/vim/init.vim $HOME/.vimrc"
ln -s $PWD/vim/init.vim $HOME/.vimrc
echo " $ ln -s $PWD/vim $HOME/.vim"
ln -s $PWD/vim $HOME/.vim
echo " $ ln -s $PWD/git/gitconfig_user $HOME/.gitconfig"
ln -s $PWD/git/gitconfig_user $HOME/.gitconfig

echo "Creating undodir for vim"
mkdir -p $HOME/.vim/undodir

echo "~~oo##> ALMOST READY <##oo~~"
echo " 1. Don't forget to update user information in $HOME/.gitconfig"
echo " 2. Install all vim plugins by executing :PlugInstall in vim"

echo "~~oo##> ############ <##oo~~"
