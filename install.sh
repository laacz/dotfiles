#!/usr/bin/env bash

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Install omza
rm -rf $HOME/.oh-my-zsh $HOME/.p10k.zsh $HOME/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME"/.oh-my-zsh/custom/themes/powerlevel10k

# Vim
rm -rf $HOME/.vimrc $HOME/.vim
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.vim $HOME/.vim

