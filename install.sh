#/bin/sh

#########################
#Dotfiles Install Script#
#########################

echo "Installing to $HOME"

mv -f ack $HOME/.ack
mv -f bashrc $HOME/.bashrc
mv -f bash_profile $HOME/.bash_profile
mv -f colordiff $HOME/.colordiff
mv -f colordiffrc $HOME/.colordiffrc
mv -f htop $HOME/.htop
mv -f htoprc $HOME/.htoprc
mv -f lesspipe $HOME/.lesspipe
mv -f profile $HOME/.profile
mv -f smem $HOME/.smem
mv -f vim $HOME/.vim
mv -f vimrc $HOME/.vimrc

echo "Done"
