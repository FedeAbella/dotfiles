# App specific configs

# fzf
if command -v fzf >/dev/null; then
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

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#Pyenv
command -v pyenv >/dev/null || export PATH="$PATH:$PYENV_ROOT/bin"
command -v pyenv >/dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Zoxide
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
