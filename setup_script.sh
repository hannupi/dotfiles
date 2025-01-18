#!/bin/bash
set -euo pipefail

export EDITOR=vim
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip"
FONT_FILE="InconsolataGo.zip"
GNOME_SETTINGS="./.config/gnome-settings.dconf"
ZSHRC_PRE="./.zshrc.pre-oh-my-zsh"
ZSHRC="./.zshrc"
KEYD_REPO="https://github.com/rvaiya/keyd"

echo "packages"
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y curl git lazygit fd-find neovim tmux fzf ripgrep go vim alacritty zsh htop yt-dlp qbittorrent vlc

echo "font"
wget -q "$FONT_URL" -O "$FONT_FILE"
unzip -o "$FONT_FILE" -d ~/.fonts
fc-cache -fv
rm -f "$FONT_FILE"

if [[ -f "$GNOME_SETTINGS" ]]; then
	echo "Applying GNOME settings..."
	dconf load / <"$GNOME_SETTINGS"
else
	echo "Warning: GNOME settings file not found at $GNOME_SETTINGS. Skipping."
fi

echo "Configuring Zsh..."
if [[ -f "$ZSHRC_PRE" ]]; then
	cp "$ZSHRC_PRE" "$ZSHRC"
else
	echo "Warning: Zsh pre-configuration file not found at $ZSHRC_PRE. Skipping."
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
mkdir -p "$ZSH_CUSTOM/plugins"
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
	echo "Cloning Zsh Autosuggestions plugin..."
	git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
	echo "Zsh Autosuggestions plugin already installed."
fi

echo "rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "nvm and node"
if [[ ! -d "$HOME/.nvm" ]]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi
nvm install node

read -p "Do you want to install Oh My Zsh? (y/n): " INSTALL_OH_MY_ZSH
if [[ "$INSTALL_OH_MY_ZSH" =~ ^[Yy]$ ]]; then
	echo "Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "keyd"
if [[ ! -d keyd ]]; then
	git clone "$KEYD_REPO"
fi
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
cd ..

echo "Script execution completed successfully!"
