fedora with i3 gaps, alacritty terminal with zsh & ohmyzsh
font consolas NF // inconsolatago NF

## Installation steps

shell installer script does these

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
```
echo ".cfg" >> .gitignore
```
```
git clone --bare https://github.com/hannupi/dotfiles.git $HOME/.cfg
```
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
```
config checkout
```

Hide unadded files for clarity
```
config config --local status.showUntrackedFiles no
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
