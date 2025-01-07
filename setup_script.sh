#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# dotfiles
dnf install lazygit fd neovim tmux fzf ripgrep go
git clone --bare git@github.com:hannupi/dotfiles.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip $HOME
dconf load / < $HOME/.config/gnome-settings.dconf

# zsh and ohmyzsh
dnf install zsh
cp $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
