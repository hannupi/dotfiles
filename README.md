Fedora with gnome, alacritty with zsh & ohmyzsh. Editor lazyvim/nvim

## Installation steps

```
git clone --bare git@github.com:hannupi/dotfiles.git $HOME/.cfg;alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME';config checkout;config config --local status.showUntrackedFiles no
```

To store possible old config files out of the way
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
--- 
Credits to durdn for the git commands
https://www.atlassian.com/git/tutorials/dotfiles
