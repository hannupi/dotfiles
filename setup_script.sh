#!/bin/bash

# zsh lazygit fd neovim tmux
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip $HOME
git clone --bare git@github.com:hannupi/dotfiles.git $HOME/.cfg
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
config config --local status.showUntrackedFiles no
dconf load / <$HOME/.config/gnome-settings.dconf
