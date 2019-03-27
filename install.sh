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

# Fail out if an error is seen
set -e

install_antibody {
  DOWNLOAD_URL="https://github.com/getantibody/antibody/releases/download"
  test -z "$TMPDIR" && TMPDIR="$(mktemp -d)"

  last_version() {
    curl -s https://raw.githubusercontent.com/getantibody/homebrew-tap/master/Formula/antibody.rb |
      grep url |
      cut -f8 -d'/'
  }

  download() {
    version="$(last_version)" || true
    test -z "$version" && {
      echo "Unable to get antibody version."
      exit 1
    }
    echo "Downloading antibody $version for $(uname -s)_$(uname -m)..."
    rm -f /tmp/antibody.tar.gz
    curl -s -L -o /tmp/antibody.tar.gz \
      "$DOWNLOAD_URL/$version/antibody_$(uname -s)_$(uname -m).tar.gz"
  }

  extract() {
    tar -xf /tmp/antibody.tar.gz -C "$TMPDIR"
  }

  download
  extract || true
  sudo mv -f "$TMPDIR"/antibody $HOME/.antibody
  which antibody
}

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

install_antibody

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

vim +PlugInstall +qa

echo "Installation to $HOME complete!"
