#/bin/sh

#########################
#Dotfiles Install Script#
#########################

echo "Installing to $HOME"

cp -r ack $HOME/.ack
cp -r bashrc $HOME/.bashrc
cp -r bash_profile $HOME/.bash_profile
cp -r colordiff $HOME/.colordiff
cp -r colordiffrc $HOME/.colordiffrc
cp -r htop $HOME/.htop
cp -r htoprc $HOME/.htoprc
cp -r lesspipe $HOME/.lesspipe
cp -r profile $HOME/.profile
cp -r smem $HOME/.smem
cp -r vim $HOME/.vim
cp -r vimrc $HOME/.vimrc

echo "Done"
