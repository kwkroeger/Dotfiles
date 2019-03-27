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
#          NAME:  install_dirs
#   DESCRIPTION: Install each directory into $HOME
#--------------------------------------------------------------------------------------------------
install_dirs() {
  items=("$@")
  for item in "${items[@]}"; do
    cp -rf $item .$item
    cp -rf .$item $HOME
    rm -rf .$item
  done
}

#---  FUNCTION  -----------------------------------------------------------------------------------
#          NAME:  install_files
#   DESCRIPTION: Install each file into $HOME
#--------------------------------------------------------------------------------------------------
install_files() {
  items=("$@")
  for item in "${items[@]}"; do
    cp -f $item $HOME/.$item
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

declare -a directories=(
'atom'
'config'
'fonts'
'lesspipe'
'vim'
)

install_files "${applications[@]}"
install_files "${configs[@]}"

install_dirs "${directories[@]}"

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

vim +PlugInstall +qa

echo "Installation to $HOME complete!"
