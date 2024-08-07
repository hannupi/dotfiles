sudo dnf install zsh
sudo dnf install neovim
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/InconsolataGo.zip $HOME
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME';echo ".cfg" >> .gitignore
git clone --bare git@github.com:hannupi/dotfiles.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME -local status.showUntrackedFiles no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
