#Zsh aliases

# Edit the zsh shell configuration
alias zshconfig='nvim -O $XDG_CONFIG_HOME/zsh/.zshrc $XDG_CONFIG_HOME/zsh/aliases.zsh $XDG_CONFIG_HOME/zsh/dirs.zsh $XDG_CONFIG_HOME/zsh/apps.zsh'

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
alias git-branches='bash ~/.local/scripts/git-branches.sh'