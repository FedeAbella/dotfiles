## Personalized z-shell configuration

# XDG envs
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
[ -d $XDG_STATE_HOME/zsh ] || mkdir $XDG_STATE_HOME/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history

## ALIASES

# Edit the zsh shell configuration
alias zshconfig='nvim ~/.zshrc'                       # edit the zshrc file
alias zshcustom='nvim ~/.local/config/.zshconfig.zsh' # edit the personalised config

# require confirmations
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias rm='nocorrect rm -i'

alias mkdir='nocorrect mkdir -pv'

## lsd aliases
alias ls='lsd -1'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -al'

## kitty aliases
alias icat='kitten icat'

## pacman aliases
alias pacman-cleanup='sudo pacman -Qdtq | sudo pacman -Rns -'

# fzf
if [[ -n $(command -v fzf) ]]; then
    alias whatalias='print -z -- $(alias | fzf | cut -d "=" -f 1)'
    alias fzfb='fzf --preview="batcat --color=always --style=numbers --line-range=:500 {}"'
    export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --multi"
    export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'

    # zsh shell integration
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
    # run the source after zsh-vi-mode, otherwise the keybindings are overwritten
    zvm_after_init_commands+=('source <(fzf --zsh)')
fi

# Script aliases
alias git-branches='bash ~/.local/scripts/git-branches.sh'

## PATH add-ons

# Local bin path
PATH=$HOME/.local/bin:$PATH

# Custom scripts
if [ -d $HOME/.local/scripts ]; then
    PATH=$HOME/.local/scripts:$PATH
fi

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# JAVA_HOME
JAVA_HOME=/usr/lib/jvm/java-21-openjdk
if [ -d $JAVA_HOME ]; then
    PATH=$PATH:$JAVA_HOME/bin
fi

#Postman
if [ -d $HOME/.local/bin/Postman ]; then
    PATH=$PATH:$HOME/.local/bin/Postman
fi

#Neovim
# if [ -d $HOME/.local/bin/nvim-linux64 ]; then
#     PATH=$PATH:$HOME/.local/bin/nvim-linux64/bin
# fi

#Go
if [ -d /usr/local/go ]; then
    PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/.config/go
    PATH=$PATH:$GOPATH/bin
fi

#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PATH:$PYENV_ROOT/bin"
command -v pyenv >/dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Generated for envman. Do not edit. (Webi)
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Zoxide
[[ ! $(command -v zoxide) ]] || eval "$(zoxide init zsh)"

## Export environment vars
export EDITOR=$(whence nvim)
export SFDX_DISABLE_DNS_CHECK=true
export SF_USE_GENERIC_UNIX_KEYCHAIN=true
export LESS="-RF"
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc
export ZVM_VI_EDITOR=$EDITOR
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
