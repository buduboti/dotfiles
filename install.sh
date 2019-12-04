#!/bin/bash

# Install requirements

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt-get update && sudo apt-get install tmux vim curl zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install tmux vim curl zsh
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

chmod 755 ~/.dotfiles/links.sh && ~/.dotfiles/links.sh

# Clone the theme repo
git clone https://github.com/chriskempson/base16-shell.git ~/.dotfiles/themes/base16-shell/
 # Apply the theme (there is a lot)
chmod 755 ~/.dotfiles/themes/base16-shell/scripts/base16-gruvbox-dark-pale.sh && ~/.dotfiles/themes/base16-shell/scripts/base16-gruvbox-dark-pale.sh

# Git
echo "Your full name [Balás Botond Barna]: "
read temp
if [ -z $temp ]
then
	# echo "Balás Botond Barna"
	git config --global user.name "Balás Botond Barna"
else
	# echo "$temp" 
	git config --global user.name "$temp"
fi

echo "Your email address [buduboti@yahoo.com]: "
read temp
if [ -z $temp ]
then
	# echo "buduboti@yahoo.com"
	git config --global user.email "buduboti@yahoo.com"
else
	# echo "$temp" 
	git config --global user.email "$temp"
fi

git config --global core.editor vim

# Zsh

# Change the default shell
chsh -s /bin/zsh

# Vim

echo | (vim +PlugInstall +qall)
