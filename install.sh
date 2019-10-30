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

install_antibody() {
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
  mv -f "$TMPDIR"/antibody $HOME/.bin/antibody
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
      cp -f "$file" "$HOME"/."$file"
    fi
  done
}

echo "Installing to $HOME"

install_files
install_dirs

if [ "$(uname)" = "Darwin" ]; then
  curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
elif [ "$(uname)" = "Linux" ]; then
  install_antibody
fi

if type git >/dev/null 2>&1; then
  git config --global user.name "kwkroeger"
  git config --global user.email "3936667+kwkroeger@users.noreply.github.com"
  echo "Git Email set to github.com, change if on a CORP network"

  rm -rf ~/.config/base16-shell
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all

	vim +PlugInstall +qa

else
  echo "Unable to install base16, fzf, git config, and vim as git is not available"
fi

if [[ ! -f $HOME/.extras ]]; then
  echo "
#/bin/sh
#
# This file to remain blank, used for site specific extensions
#
  " > $HOME/.extras
fi

if [[ ! -d $HOME/.ssh/multiplex ]]; then
  mkdir $HOME/.ssh/multiplex
  chmod 700 $HOME/.ssh/multiplex
fi

echo "Installation to $HOME complete!"
