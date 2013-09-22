#/bin/sh

#########################
#Dotfiles Install Script#
#########################

echo "Installing to $HOME"

cp -f ack $HOME/.ack
cp -f bashrc $HOME/.bashrc
cp -f bash_profile $HOME/.bash_profile
cp -f colordiff $HOME/.colordiff
cp -f colordiffrc $HOME/.colordiffrc
cp -f htop $HOME/.htop
cp -f htoprc $HOME/.htoprc

#Folder merge workaround
cp -rf lesspipe .lesspipe
cp -rf .lesspipe $HOME
rm -rf .lesspipe

cp -f profile $HOME/.profile
cp -f smem $HOME/.smem

#Folder merge workaround
cp -rf vim .vim
cp -rf .vim $HOME
rm -rf .vim

cp -f vimrc $HOME/.vimrc

echo "Done"
