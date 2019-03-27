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
  directories=($(ls -p | grep /))
  for dir in "${directories[@]}"; do
    cp -rf $dir .$dir
    cp -rf .$dir $HOME
    rm -rf .$dir
  done
}

#---  FUNCTION  -----------------------------------------------------------------------------------
#          NAME:  install_files
#   DESCRIPTION: Install each file into $HOME
#--------------------------------------------------------------------------------------------------
install_files() {
  files=($(ls -p | grep -v /))
  for file in "${files[@]}"; do
    if [[ $file == "install.sh" ]]; then
      continue
    elif [[ $file == "readme.md" ]]; then                                                            
      continue                                                                                      
    else 
      cp -f $file $HOME/.$file
    fi
  done
}

echo "Installing to $HOME"

install_files
install_dirs

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

vim +PlugInstall +qa

echo "Installation to $HOME complete!"
