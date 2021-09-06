#!/usr/bin/env zsh

#        _                             _
#   ___ | |__  _ __ ___  _   _ _______| |__
#  / _ \| '_ \| '_ ` _ \| | | |_  / __| '_ \
# | (_) | | | | | | | | | |_| |/ /\__ \ | | |
#  \___/|_| |_|_| |_| |_|\__, /___|___/_| |_|
#                        |___/

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
)

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/ohmyzsh/custom/themes/spaceship.zsh-theme"
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  char          # Prompt character
)

# Path to your ohmyzsh installation.
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/ohmyzsh/oh-my-zsh.sh"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

#  ____  _           _ _
# | __ )(_)_ __   __| (_)_ __   __ _ ___
# |  _ \| | '_ \ / _` | | '_ \ / _` / __|
# | |_) | | | | | (_| | | | | | (_| \__ \
# |____/|_|_| |_|\__,_|_|_| |_|\__, |___/
#                              |___/

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^f' autosuggest-accept

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# bind ctrl-o to lf
bindkey -s '^o' 'lf\n'

# Change KEYTIMEOUT
export KEYTIMEOUT=1

#  ____                       _
# / ___|  ___  _   _ _ __ ___(_)_ __   __ _
# \___ \ / _ \| | | | '__/ __| | '_ \ / _` |
#  ___) | (_) | |_| | | | (__| | | | | (_| |
# |____/ \___/ \__,_|_|  \___|_|_| |_|\__, |
#                                     |___/

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Load NVM
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source $NVM_DIR/nvm.sh --no-use
# Set NPM
nvm use 14 > /dev/null 2>&1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rt-kill/.config/google-cloud-sdk/src/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rt-kill/.config/google-cloud-sdk/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/rt-kill/.config/google-cloud-sdk/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rt-kill/.config/google-cloud-sdk/src/google-cloud-sdk/completion.zsh.inc'; fi
