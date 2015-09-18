#/bin/sh

#########################
#Dotfiles Install Script#
#########################

echo "Installing to $HOME"

cp -f bash_profile $HOME/.bash_profile
cp -f bashrc $HOME/.bashrc
cp -f colordiff $HOME/.colordiff
cp -f colordiffrc $HOME/.colordiffrc
cp -f gitconfig $HOME/.gitconfig
cp -f gitignore $HOME/.gitignore
cp -f htop $HOME/.htop
cp -f htoprc $HOME/.htoprc
cp -f osx $HOME/.osx
cp -f zshrc $HOME/.zshrc


mkdir .atom
cp -f config.cson $HOME/.atom/

SYSTEM=`uname -a`
if [[ $SYSTEM =~ .*Darwin.* ]]; then
  cp -f pt/osx-pt $HOME/.pt
else
  cp -f pt/linux-pt $HOME/.pt
fi

cp -rf lesspipe .lesspipe
cp -rf .lesspipe $HOME
rm -rf .lesspipe

cp -f profile $HOME/.profile
cp -f smem $HOME/.smem

cp -rf vim .vim
cp -rf .vim $HOME
rm -rf .vim

cp -f vimrc $HOME/.vimrc
cp -f wgetrc $HOME/.wgetrc

echo "Done"
