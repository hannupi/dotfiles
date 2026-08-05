#!/bin/bash
set -euo pipefail

GNOME_SETTINGS="./.config/gnome-settings.dconf"
ZSHRC_PRE="./.zshrc.pre-oh-my-zsh"
ZSHRC="./.zshrc"

CODENAME=$(. /etc/os-release && echo "${VERSION_CODENAME:-trixie}")

if ! dpkg -s ghostty >/dev/null 2>&1; then
  echo "Adding Ghostty apt repo..."
  sudo install -d -m 0755 /etc/apt/keyrings
  curl -fsSL https://deb.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | sudo gpg --dearmor --yes -o /etc/apt/keyrings/deb.griffo.io.gpg
  echo "deb [signed-by=/etc/apt/keyrings/deb.griffo.io.gpg] https://deb.griffo.io/apt ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/deb.griffo.io.list > /dev/null
fi

sudo apt-get update
sudo apt-get install -y curl wget git less lazygit fd-find neovim tmux fzf ripgrep golang vim ghostty zsh htop yt-dlp qbittorrent vlc ffmpeg

if [[ -f "$GNOME_SETTINGS" ]]; then
  echo "Applying GNOME settings..."
  dconf load / <"$GNOME_SETTINGS"
else
  echo "Warning: GNOME settings file not found at $GNOME_SETTINGS. Skipping."
fi

if [[ -f "$ZSHRC_PRE" ]]; then
  echo "Configuring Zsh..."
  chsh -s $(which zsh)
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

if [[ ! -f "/usr/bin/mullvad" ]]; then
  read -p "Mullvad (y/n): " confirm
  if [[ "$confirm" == [yY] ]]; then
    sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
    echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable stable main" | sudo tee /etc/apt/sources.list.d/mullvad.list
    sudo apt update
    sudo apt install mullvad-vpn
  fi
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
