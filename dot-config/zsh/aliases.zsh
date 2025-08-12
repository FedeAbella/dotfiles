#Zsh aliases

# Edit the zsh shell configuration
alias zshconfig='nvim -O $XDG_CONFIG_HOME/zsh/.zshrc $XDG_CONFIG_HOME/zsh/aliases.zsh $XDG_CONFIG_HOME/zsh/apps.zsh'

alias open='xdg-open'

# require confirmations
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias rm='nocorrect rm -i'

alias mkdir='nocorrect mkdir -pv'

## lsd
alias ls='lsd -1'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -al'

## kitty
alias icat='kitten icat'

## pacman
alias pacman-cleanup='sudo pacman -Qdtq | sudo pacman -Rns -'

## hyprland
alias hyprconfig='nvim $HOME/.config/hypr/hyprland.conf'

# nvim
alias nv='nvim'

# git
alias gadd='git add .'
alias gc='git commit'
alias gca='git commit --amend'
alias gsu='git status -u'
