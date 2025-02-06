export VISUAL="vim"
export EDITOR="$VISUAL"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ZSH_THEME=""
PS1='${debian_chroot:+($debian_chroot)}%F{green}%n@%m%f:%F{blue}%~%f$ '

zstyle ':omz:update' mode auto

ENABLE_CORRECTION="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

plugins=(
  git
  zsh-autosuggestions
)

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias e='/usr/bin/nvim'
alias us='setxkbmap us'
alias en='setxkbmap us'
alias fin='setxkbmap fi'
alias brig='brightnessctl set'
alias sd='systemctl poweroff'
alias rs='systemctl reboot'
alias wifi='nmcli d wifi'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

todo() {
    clear
    cal -3 -m 
    cat "$HOME/todo.md"
}
alias td='todo'
alias te="vim $HOME/todo.md"

unsetopt autocd

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
