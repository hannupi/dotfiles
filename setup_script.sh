#!/bin/bash

# sudo dnf copr enable atim/lazygit -y && sudo dnf install -y curl git lazygit fd nvim tmux fzf ripgrep go vim alacritty zsh htop yt-dlp qbittorrent vlc lazygit

EDITOR=vim
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip
unzip InconsolataGo.zip
dconf load / <./.config/gnome-settings.dconf

cp ./.zshrc.pre-oh-my-zsh ./.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && nvm install node
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
