#/bin/sh

#########################
#Dotfiles Install Script#
#########################

echo "Installing to $HOME"

cp -f aliases $HOME/.aliases
cp -f bash_profile $HOME/.bash_profile
cp -f bashrc $HOME/.bashrc
cp -f colordiff $HOME/.colordiff
cp -f colordiffrc $HOME/.colordiffrc
cp -f e $HOME/.e
cp -f gitconfig $HOME/.gitconfig
cp -f gitignore $HOME/.gitignore
cp -f htop $HOME/.htop
mkdir -p $HOME/.config/htop; cp -f htoprc $HOME/.config/htop/.htoprc
rm -f $HOME/.htoprc
cp -f osx $HOME/.osx
cp -f toprc $HOME/.toprc
cp -f zshrc $HOME/.zshrc

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

cp -rf fonts .fonts
cp -rf .fonts $HOME
rm -rf .fonts

mkdir -p $HOME/.atom
cp -f config.cson $HOME/.atom/

cp -rf lesspipe .lesspipe
cp -rf .lesspipe $HOME
rm -rf .lesspipe

cp -f profile $HOME/.profile
cp -f smem $HOME/.smem
cp -f spaceship $HOME/.spaceship

cp -rf vim .vim
cp -rf .vim $HOME
rm -rf .vim

cp -f variables $HOME/.variables
cp -f vimrc $HOME/.vimrc
cp -f wgetrc $HOME/.wgetrc

vim +PlugInstall +qa

echo "Done"
