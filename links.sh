#!/bin/bash

ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
 mkdir ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
