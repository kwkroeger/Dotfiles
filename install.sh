#!/usr/bin/env bash
#==================================================================================================
# vim: softtabstop=2 shiftwidth=2 fenc=utf-8 cc=100
#==================================================================================================
#
#          FILE: install.sh
#
#   DESCRIPTION: Copy dotfiles from the git pull to their correct positions under $HOME
#
#==================================================================================================

#---  FUNCTION  -----------------------------------------------------------------------------------
#          NAME:  install_each_in
#   DESCRIPTION:  For each item install it into $HOME
#--------------------------------------------------------------------------------------------------
install_each_in() {
  items=("$@")
  for item in "${items[@]}"; do
    cp $item $HOME/.$item
  done
}

echo "Installing to $HOME"

declare -a configs=(
'aliases'
'bash_profile'
'bashrc'
'colordiff'
'colordiffrc'
'gitconfig'
'gitignore'
'osx'
'profile'
'spaceship'
'toprc'
'variables'
'vimrc'
'wgetrc'
'zshrc'
)

declare -a applications=(
'e'
'htop'
'smem'
)

install_each_in "${applications[@]}"
install_each_in "${configs[@]}"

mkdir -p $HOME/.config/htop; cp -f htoprc $HOME/.config/htop/.htoprc
rm -f $HOME/.htoprc

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

cp -rf fonts .fonts
cp -rf .fonts $HOME
rm -rf .fonts

mkdir -p $HOME/.atom
cp -f config.cson $HOME/.atom/

cp -rf lesspipe .lesspipe
cp -rf .lesspipe $HOME
rm -rf .lesspipe

cp -rf vim .vim
cp -rf .vim $HOME
rm -rf .vim

vim +PlugInstall +qa

echo "Installation to $HOME complete!"
