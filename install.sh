#!/bin/bash

# Install requirements

if [[ "$OSTYPE" == ^linux-[a-z]+$ ]]; then
	sudo apt update 
	sudo apt upgrade 
	sudo apt install -y tmux
	sudo apt install -y vim
	sudo apt install -y curl
	sudo apt install -y zsh
	sudo apt install -y acpi 
	sudo apt install -y q
	sudo apt install -y locales

	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	export LANGUAGE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	sudo locale-gen en_US.UTF-8

elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
	sudo apt update 
	sudo apt upgrade 
	sudo apt install -y tmux
	sudo apt install -y vim
	sudo apt install -y curl
	sudo apt install -y zsh
	sudo apt install -y acpi 
	sudo apt install -y q
	sudo apt install -y locales

	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	export LANGUAGE=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	sudo locale-gen en_US.UTF-8


elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install tmux vim curl zsh jq fzf
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

chmod 755 ~/.dotfiles/links.sh && ~/.dotfiles/links.sh

# Clone the theme repo
git clone https://github.com/chriskempson/base16-shell.git ~/.dotfiles/themes/base16-shell/
 # Apply the theme (there is a lot)
chmod 755 ~/.dotfiles/themes/base16-shell/scripts/base16-gruvbox-dark-soft.sh && ~/.dotfiles/themes/base16-shell/scripts/base16-gruvbox-dark-soft.sh
chmod 755 ~/.dotfiles/themes/base16-shell/scripts/base16-gruvbox-light-soft.sh
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

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.dotfiles/zsh/plugins/zsh-syntax-highlighting 
git clone https://github.com/b4b4r07/enhancd ~/.dotfiles/zsh/plugins/enhancd

# Change the default shell
echo "password for chsh:"
chsh -s /bin/zsh

# Vim

echo | (vim +PlugInstall +qall)


