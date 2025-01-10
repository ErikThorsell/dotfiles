#!/usr/bin/env bash

ready="n"
while [[ $ready != 'y' ]]; do
  echo "\nDo your dotfiles repository reside in $HOME/dotfiles? (y/n)"
  read -n 1 ready
done;

echo "~~oo##> SETTING UP DOTFILES <##oo~~"
echo "All files/directories will be backed up to $HOME/<name>.bak"
echo "If everything works, just remove the .bak-files"

echo "Creating symlinks in $HOME/"

shell=""
echo "\nWhich shell do you want to use? (bash/zsh)"
read shell
if [[ $shell == 'bash' ]]; then

  [ -f $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/bashrc.bak
  echo " $ ln -s $PWD/bash/bashrc $HOME/.bashrc"
  ln -s $PWD/bash/bashrc $HOME/.bashrc

  [ -f $HOME/.profile ] && mv $HOME/.profile $HOME/profile.bak
  echo " $ ln -s $PWD/bash/profile $HOME/.profile"
  ln -s $PWD/bash/profile $HOME/.profile

elif [[ $shell == 'zsh' ]]; then

  omz="y"
  echo "\nDo you want to install Oh-my-ZSH? (Y/n)"
  read omz
  if [[ ${omz,,} == 'y' ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi

  [ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/zshrc.bak
  echo " $ ln -s $PWD/zsh/zshrc $HOME/.zshrc"
  ln -s $PWD/zsh/zshrc $HOME/.zshrc

  [ -f $HOME/.zprofile ] && mv $HOME/.zprofile $HOME/zprofile.bak
  echo " $ ln -s $PWD/zsh/zshrc_zprofile $HOME/.zprofile"
  ln -s $PWD/zsh/zshrc_zprofile $HOME/.zprofile

else

  echo " The shell $shell is not supported!"

fi

[ -f $HOME/.vimrc ] && mv $HOME/.vimrc $HOME/vimrc.bak
echo " $ ln -s $PWD/vim/init.vim $HOME/.vimrc"
ln -s $PWD/vim/init.vim $HOME/.vimrc

[ -f $HOME/.vim ] && mv $HOME/.vim $HOME/vim.bak
echo " $ ln -s $PWD/vim $HOME/.vim"
ln -s $PWD/vim $HOME/.vim

[ -f $HOME/.gitconfig ] && mv $HOME/.gitconfig $HOME/gitconfig.bak
cat <<EOF > $HOME/.gitconfig
[user]
  name = Erik Thorsell
  email = erik@thorsell.io

[include]
  path = ~/dotfiles/git/gitconfig_common

[includeIf "gitdir:~/work/<company>/"]
  path = ~/work/<company>/.gitconfig_include
EOF
echo "Created new .gitconfig with specified content."

echo "Creating undodir for vim"
mkdir -p $HOME/.vim/undodir

echo "~~oo##> INSTALLING asdf <##oo~~"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

sway="n"
echo "\nDo you want to link configuration for sway, waybar and wofi? (y/n)"
read -n 1 sway
if [[ $sway == 'y' ]]; then

  [ -f $HOME/.config/sway ] && mv $HOME/.config/sway $HOME/sway.bak
  echo " $ ln -s $PWD/config/sway $HOME/.config/sway"
  ln -s $PWD/config/sway $HOME/.config/sway

  [ -f $HOME/.config/waybar ] && mv $HOME/.config/waybar $HOME/waybar.bak
  echo " $ ln -s $PWD/config/waybar $HOME/.config/waybar"
  ln -s $PWD/config/waybar $HOME/.config/waybar

  [ -f $HOME/.config/wofi ] && mv $HOME/.config/wofi $HOME/wofi.bak
  echo " $ ln -s $PWD/config/wofi $HOME/.config/wofi"
  ln -s $PWD/config/wofi $HOME/.config/wofi

else
  echo "OK - Skipping!"
fi;

echo "~~oo##> ALMOST READY <##oo~~"
echo " 1. Don't forget to update user information in $HOME/.gitconfig"
echo " 2. Install all vim plugins by executing :PlugInstall in vim"
echo " 3. Install delta (github.com/dandavision/delta)"

