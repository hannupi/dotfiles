#!/bin/bash
set -euo pipefail

FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip"
FONT_FILE="InconsolataGo.zip"
GNOME_SETTINGS="./.config/gnome-settings.dconf"
ZSHRC_PRE="./.zshrc.pre-oh-my-zsh"
ZSHRC="./.zshrc"
KEYD_REPO="https://github.com/rvaiya/keyd"

echo "packages"
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y curl wget git less lazygit fd-find neovim tmux fzf ripgrep go vim alacritty zsh htop yt-dlp qbittorrent vlc ffmpeg

if [[ -f "$GNOME_SETTINGS" ]]; then
	echo "Applying GNOME settings..."
	dconf load / <"$GNOME_SETTINGS"
else
	echo "Warning: GNOME settings file not found at $GNOME_SETTINGS. Skipping."
fi

if [[ -f "$ZSHRC_PRE" ]]; then
	echo "Configuring Zsh..."
	cp "$ZSHRC_PRE" "$ZSHRC"
else
	echo "Warning: Zsh pre-configuration file not found at $ZSHRC_PRE. Skipping."
fi

if [[ ! -f "$HOME/.cargo/bin/rustup" ]]; then
	echo "rust"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

if [[ ! -d "$HOME/.nvm" ]]; then
	echo "nvm and node"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	nvm install node
fi

if [[ ! -f "$HOME/.fonts/InconsolataGoNerdFont-Regular.ttf" ]]; then
	echo "font"
	wget -q "$FONT_URL" -O "$FONT_FILE"
	unzip -o "$FONT_FILE" -d ~/.fonts
	fc-cache -fv
	rm -f "$FONT_FILE"
fi

if [[ ! -d keyd ]]; then
	echo "keyd"
	git clone "$KEYD_REPO"
	cd keyd
	make && sudo make install
	sudo systemctl enable --now keyd
	cd ..
	if [[ ! -f "/etc/keyd/default.conf" ]]; then
		sudo ln -s ~/.config/keyd/default.conf /etc/keyd/default.conf
	fi
fi

if [[ ! -f "/usr/bin/mullvad"]]; then
	echo "mullvad"
	sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
	sudo dnf install mullvad-vpn -y
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	echo "Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
	mkdir -p "$ZSH_CUSTOM/plugins"
	if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
		# reminder: this needs to be installed AFTER ohmyzsh
		echo "Cloning Zsh Autosuggestions plugin..."
		git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
	else
		echo "Zsh Autosuggestions plugin already installed."
	fi

	mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
fi

echo "script done"
