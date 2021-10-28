#!/usr/bin/env bash

ready="n"
while [[ $ready != 'y' ]]; do
    echo -e "\nDo your dotfiles repository reside in $HOME/dotfiles? (y/n)"
    read -n 1 ready
done;

echo "~~oo##> SETTING UP DOTFILES <##oo~~"
echo "All files/directories will be backed up to $HOME/<name>.bak"
echo "If everything works, just remove the .bak-files"

echo "Creating symlinks in $HOME/"

[ -f $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/bashrc.bak
echo " $ ln -s $PWD/bash/bashrc $HOME/.bashrc"
ln -s $PWD/bash/bashrc $HOME/.bashrc

[ -f $HOME/.profile ] && mv $HOME/.profile $HOME/profile.bak
echo " $ ln -s $PWD/bash/profile $HOME/.profile"
ln -s $PWD/bash/profile $HOME/.profile

[ -f $HOME/.vimrc ] && mv $HOME/.vimrc $HOME/vimrc.bak
echo " $ ln -s $PWD/vim/init.vim $HOME/.vimrc"
ln -s $PWD/vim/init.vim $HOME/.vimrc

[ -f $HOME/.vim ] && mv $HOME/.vim $HOME/vim.bak
echo " $ ln -s $PWD/vim $HOME/.vim"
ln -s $PWD/vim $HOME/.vim

[ -f $HOME/.gitconfig ] && mv $HOME/.gitconfig $HOME/gitconfig.bak
echo " $ ln -s $PWD/git/gitconfig_user $HOME/.gitconfig"
ln -s $PWD/git/gitconfig_user $HOME/.gitconfig

echo "Creating undodir for vim"
mkdir -p $HOME/.vim/undodir

echo "~~oo##> INSTALLING asdf <##oo~~"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

echo "~~oo##> ALMOST READY <##oo~~"
echo " 1. Don't forget to update user information in $HOME/.gitconfig"
echo " 2. Install all vim plugins by executing :PlugInstall in vim"

