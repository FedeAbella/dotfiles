#Zsh aliases

# nvim in Ubuntu
[[ $(command -v nvim) ]] || [[ ! -d $HOME/.local/bin/nvim-linux64/bin ]] || alias nvim='$HOME/.local/bin/nvim-linux64/bin/nvim'

# Edit the zsh shell configuration
alias zshconfig='nvim -O $XDG_CONFIG_HOME/zsh/.zshrc $XDG_CONFIG_HOME/zsh/aliases.zsh $XDG_CONFIG_HOME/zsh/dirs.zsh $XDG_CONFIG_HOME/zsh/apps.zsh'

alias open='xdg-open'

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

## hyprland aliases
alias hyprconfig='nvim $HOME/.config/hypr/hyprland.conf'

# Script aliases
alias gb='bash ~/.local/scripts/git/branches.sh'
alias gnb='bash ~/.local/scripts/git/newbranch.sh'
alias grb='bash ~/.local/scripts/git/rebasefrom.sh'
alias gsp='bash ~/.local/scripts/git/switchandpull.sh'
