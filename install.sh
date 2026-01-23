#!/usr/bin/env bash

set -euo pipefail

# Hide "last login" line when starting a new terminal session
touch "$HOME/.hushlogin"

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
rm -rf "$HOME/.zshrc"
ln -s "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
rm -rf "$HOME/.p10k.zsh"
ln -s "$HOME/.dotfiles/.p10k.zsh" "$HOME/.p10k.zsh"
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# Vim
rm -rf "$HOME/.vimrc" "$HOME/.vim"
ln -s "$HOME/.dotfiles/.vimrc" "$HOME/.vimrc"
ln -s "$HOME/.dotfiles/.vim" "$HOME/.vim"

# git
rm -rf "$HOME/.gitconfig"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

# tmux
rm -rf "$HOME/.tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
rm -rf "$HOME/.config/tmux"
ln -s "$HOME/.dotfiles/.config/tmux" "$HOME/.config/tmux"

# ghostty
# if on osx, ln ghostty.config to $HOME/Library/Application Support/com.mitchellh.ghostty/config
if [ "$(uname)" = "Darwin" ]; then
  mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
  rm -rf "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
  ln -s "$HOME/.dotfiles/ghostty.config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
fi

# nvim
rm -rf "$HOME/.config/nvim"
ln -s "$HOME/.dotfiles/.config/nvim" "$HOME/.config/nvim"

# mutagen
rm -rf "$HOME/.mutagen.yml"
ln -s "$HOME/.dotfiles/.mutagen.yml" "$HOME/.mutagen.yml"

# zed
mkdir -p "$HOME/.config/zed"
rm -rf "$HOME/.config/zed/settings.json"
ln -s "$HOME/.dotfiles/zed/settings.json" "$HOME/.config/zed/settings.json"
rm -rf "$HOME/.config/zed/keymap.json"
ln -s "$HOME/.dotfiles/zed/keymap.json" "$HOME/.config/zed/keymap.json"

# psqlrc
rm -rf "$HOME/.psqlrc"
ln -s "$HOME/.dotfiles/.psqlrc" "$HOME/.psqlrc"

# Claude Code
for FFF in "$HOME/.dotfiles/claude"/*
do
    FFF=${FFF##*/}
    echo "Claude Code: copying $FFF"
    rm -rf "$HOME/.claude/$FFF"
    ln -s "$HOME/.dotfiles/claude/$FFF" "$HOME/.claude/$FFF"
done
