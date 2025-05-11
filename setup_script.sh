#!/bin/bash
set -euo pipefail

GNOME_SETTINGS="./.config/gnome-settings.dconf"
ZSHRC_PRE="./.zshrc.pre-oh-my-zsh"
ZSHRC="./.zshrc"
KEYD-2.5.0="https://github.com/rvaiya/keyd/archive/refs/tags/v2.5.0.tar.gz"

sudo dnf copr enable atim/lazygit -y
sudo dnf copr enable pgdev/ghostty
sudo dnf install -y curl wget git less lazygit fd-find neovim tmux fzf ripgrep go vim ghostty zsh htop yt-dlp qbittorrent vlc ffmpeg

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

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

if [[ ! -d "keyd-2.5.0" ]]; then
  echo "keyd"
  wget "$KEYD-2.5.0" -O keyd.tar.gz
  tar -xf keyd.tar.gz
  cd keyd
  make && sudo make install
  sudo systemctl enable --now keyd
  cd ..
  if [[ ! -f "/etc/keyd/default.conf" ]]; then
    sudo ln -s ~/.config/keyd/default.conf /etc/keyd/default.conf
  fi
fi

if [[ ! -f "/usr/bin/mullvad" ]]; then
  read -p "Mullvad (y/n): " confirm
  if [[ "$confirm" == [yY] ]]; then
    sudo dnf config-manager --add-repo=https://repository.mullvad.net/rpm/stable/mullvad.repo
    sudo dnf install mullvad-vpn -y
  fi
fi

if [[ "$SHELL" == */zsh ]] && [[ ! -d "$HOME/.oh-my-zsh" ]]; then
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
