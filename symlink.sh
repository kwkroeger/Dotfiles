#/bin/sh

#########################
#Dotfiles Symlink Script#
#########################

echo "Linking to $HOME"

export PWD=$(pwd)

ln -s $PWD/ack $HOME/.ack
ln -s $PWD/bashrc $HOME/.bashrc
ln -s $PWD/bash_profile $HOME/.bash_profile
ln -s $PWD/colordiff $HOME/.colordiff
ln -s $PWD/colordiffrc $HOME/.colordiffrc
ln -s $PWD/htop $HOME/.htop
ln -s $PWD/htop $HOME/.htoprc
ln -s $PWD/lesspipe $HOME/.lesspipe
ln -s $PWD/profile $HOME/.profile
ln -s $PWD/smem $HOME/.smem
ln -s $PWD/vim $HOME/.vim
ln -s $PWD/vimrc $HOME/.vimrc

echo "Done"
