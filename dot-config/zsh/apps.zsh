# App specific configs

# fzf
if command -v fzf >/dev/null; then
    alias walias='print -z -- $(alias | fzf --no-preview | cut -d "=" -f 1)'

    export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --multi \
    --bind 'ctrl-u:preview-half-page-up' \
    --bind 'ctrl-d:preview-half-page-down'"
    export FZF_CTRL_T_OPTS=" \
    --walker-skip SteamLibrary,.steam,.git,node_modules \
    --preview=\"bat --color=always --style=numbers --line-range=:500 {}\""
    export FZF_ALT_C_OPTS="--walker-skip SteamLibrary,node_modules --walker dir,follow --preview 'tree -C {}'"
    export FZF_COMPLETION_DIR_OPTS="--walker-skip SteamLibrary,.steam --preview 'tree -C {}'"

    # run the source after zsh-vi-mode, otherwise the keybindings are overwritten
    [[ ! -f /usr/share/fzf/completion.zsh ]] || zvm_after_init_commands+=('source <(fzf --zsh)')
fi

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#Pyenv
command -v pyenv >/dev/null || export PATH="$PATH:$PYENV_ROOT/bin"
command -v pyenv >/dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"
