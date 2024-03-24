## Personalized z-shell configuration

## ALIASES

# Edit the zsh shell configuration
alias zshconfig='nvim ~/.zshrc' # edit the zshrc file
alias zshcustom='nvim ~/.local/config/.zshconfig.zsh' # edit the personalised config

# require confirmations
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias rm='nocorrect rm -i'

alias mkdir='nocorrect mkdir -pv'

## lsd aliases
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'

# Misc aliases
[[ ! -f $HOME/.local/scripts/imwheelrc/mousewheel.sh ]] || alias mousewheel='~/.local/scripts/imwheelrc/mousewheel.sh' # edit mouse wheel speed

# Script aliases
alias git-branches='bash ~/.local/scripts/git-branches.sh'

## END ALIASES

## PATH add-ons

# Local bin path
PATH=$HOME/.local/bin:$PATH

# Custom scripts
if [ -d $HOME/.local/scripts ]; then
    PATH=$HOME/.local/scripts:$PATH
fi

# Ruby
PATH=$PATH:$(which ruby)

# JAVA_HOME
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
if [ -d $JAVA_HOME ]; then
    PATH=$PATH:$JAVA_HOME/bin
fi

#Postman
if [ -d $HOME/.local/bin/Postman ]; then
    PATH=$PATH:$HOME/.local/bin/Postman
fi

#Neovim
if [ -d $HOME/.local/bin/nvim-linux64 ]; then
    PATH=$PATH:$HOME/.local/bin/nvim-linux64/bin
fi

## Export environment vars
export EDITOR=$(whence nvim)
export SFDX_DISABLE_DNS_CHECK=true
export LESS="-RF"
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgreprc

## Navigation
# Function to navigate up X directories
# Taken from DT, modified heavily
up () {
    local d="" # start from an empty string
    local limit=$1 # get parameter

        # error messages
        local errNonInt="ERROR: up requires positive integer or no parameters"
        local errOutBound="ERROR: parameter must be between 1 and 99"

        # Default to limit of 1 if null parameter
        if [ -z $limit ]
        then
            limit=1
        fi

        # throw error if parameter is not a number
        (echo $limit | grep -Eq ^[0-9]+$) || (echo $errNonInt && return 1)

        # throw error if parameter is not 1-99
        if [[ $limit -ge 100 || $limit == 0 ]]
        then
            echo $errOutBound
            return 1
        fi

        # construct cd string
        for ((i=1;i<=limit;i++)); do
            d="../$d"
        done

        cd $d # move
    }

## lsd tree
# function to call lsd --tree with a given depth more easily
if [ alias lt >/dev/null 2>&1 ]; then
    unalias lt
fi
lt () {
    local depth=$1 # get parameter

        # error messages
        local errNonInt="ERROR: lt requires positive integer, or zero (for infinite depth)"

        # Default to limit of 1 if null parameter
        if [ -z $depth ]
        then
            depth=1
        fi

        # throw error if parameter is not a number
        (echo $depth | grep -Eq ^[0-9]+$) || (echo $errNonInt && return 1)

        if [ $depth -eq 0 ]
        then
            lsd --tree
        else
            lsd --tree --depth $depth
        fi

        return
    }
