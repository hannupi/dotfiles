#!/bin/bash

# sudo dnf install lazygit fd nvim tmux fzf ripgrep go vim alacritty zsh htop yt-dlp qbittorrent vlc

EDITOR=vim
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip
unzip InconsolataGo.zip
dconf load / <./.config/gnome-settings.dconf

cp ./.zshrc.pre-oh-my-zsh ./.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
