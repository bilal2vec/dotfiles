#!/bin/zsh

# oh-my-zsh 
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

source $HOME/dotfiles/secrets.env

# rust
source $HOME/.cargo/bin
source $HOME/.cargo/env

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# starship
eval "$(starship init zsh)"

# match bat theme with terminal
export BAT_THEME="Solarized (light)"

# git signed commits
export GPG_TTY=$(tty)

# fzf
source <(fzf --zsh)

sudo yabai --load-sa

# general aliases
alias ..='cd ..'
alias ls='eza -al'
alias cat='bat'
alias py='python'
alias ga='git add'
alias gaa='git add .'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gl='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias vim='nvim'

export PATH="${HOME}/.local/bin:$PATH"
