#!/usr/bin/env bash

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Install omza
rm -rf $HOME/.oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
rm -rf $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel10k

# Vim
rm -rf $HOME/.vimrc $HOME/.vim
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.vim $HOME/.vim

# git
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig


# tmux
rm -rf $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
rm -rf $HOME/.config/tmux
ln -s $HOME/.dotfiles/.config/tmux $HOME/.config/tmux

# ghostty
# if on osx, ln ghostty.config to $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
rm -rf $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
ln -s $HOME/.dotfiles/ghostty.config $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
