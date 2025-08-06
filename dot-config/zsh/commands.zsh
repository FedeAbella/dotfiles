# ripgrep->fzf->nvim [QUERY]
# https://junegunn.github.io/fzf/tips/ripgrep-integration/
frg() (
    reload='reload:rg --column --color=always --smart-case {q} || :'
    opener='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
    fzf --disabled --ansi --multi \
        --bind "start:$reload" --bind "change:$reload" \
        --bind "enter:become:$opener" \
        --bind "ctrl-o:execute:$opener" \
        --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
        --delimiter : \
        --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
        --preview-window '~4,+{2}+4/3,<80(up)' \
        --query "$*"
)

## git
# Pretty list git branches with remote and description
gb() (
    git_root=$(git rev-parse --show-toplevel 2>&1)
    [[ -d "$git_root" ]] || { echo "Not a git repository" >&2 && return 1; }

    print_string="\033[31;1mBranch\033[0m\t\033[31;1mRemote\033[0m\t\033[31;1mDescription\033[0m\n"

    while read -r branch; do
        clean_branch_name=$(
            echo "${branch//\*\ /}" | # remove "* " marking current branch
                tr -d '[:cntrl:]' |
                sed -E "s/\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | # remove colors
                sed -E "s/^.+ -> //g"                              # replace symbolic-ref like `HEAD -> master`
        )

        description=$(git config branch."$clean_branch_name".description)
        remote=$(git config branch."$clean_branch_name".remote)
        merge=$(git config branch."$clean_branch_name".merge | cut --delimiter="/" --fields=3-)

        branch_col="${branch}"
        if [[ "${branch::1}" != "*" ]]; then
            # Add spaces to account for "* " at the start of current branch
            branch_col="  ${branch_col}"
        fi

        remote_col=""
        if [[ -n "$remote" ]] && [[ -n "$merge" ]]; then
            remote_col="\e[1;34m[${remote}/${merge}]\e[0m"
        fi

        print_string+="${branch_col}\t${remote_col}\t${description}\n"
    done < <(git branch --list "--color")

    printf '%b' "$print_string" | column --table --separator $'\t'
)

# Create a local .gitignore file
glocignore() (
    git_root=$(git rev-parse --show-toplevel 2>&1)
    [[ -d "$git_root" ]] || { echo "Not a git repository" >&2 && exit 1; }

    ln -sf "$git_root"/.git/info/exclude "$git_root"/.gitignore-local
    echo ".gitignore-local" >>"$git_root"/.gitignore-local
)

# Create a new git branch from another, move to it and add a description
gnb() {
    [[ -d "$(git rev-parse --show-toplevel 2>&1)" ]] || { echo "Not a git repository" >&2 && exit 1; }

    if [[ -z $1 ]] || [[ -z $2 ]]; then
        echo "Must specify to and from branches" >&2
        exit 1
    fi

    git switch "$1" && git pull && git switch -c "$2" && git branch --edit-description
}

# git pretty log
glog() {
    git log --color=always --pretty="%C(red)%h%C(auto)%d%Creset %s %C(yellow)by %an %C(cyan)(%ar)%Creset" ${1:"HEAD"}
}

# git prettified log -> fzf -> output hash
gl() {
    [[ -d "$(git rev-parse --show-toplevel 2>&1)" ]] || { echo "Not a git repository" >&2 && return 1; }

    glog "$1" |
        fzf --ansi --no-sort --reverse --preview="git show --color=always {1}" |
        sed -e "s/ .*//"
}

# Pull another branch and rebase current branch from that one
grb() {
    [[ -d "$(git rev-parse --show-toplevel 2>&1)" ]] || { echo "Not a git repository" >&2 && return 1; }

    [[ -n "$1" ]] || { echo "Must specify branch to rebase from" >&2 && exit 1; }

    git pull "${2:-remote}" "$1:$1" && git rebase "$1"
}

# Switch to another branch and pull to it
gsp() {
    [[ -d "$(git rev-parse --show-toplevel 2>&1)" ]] || { echo "Not a git repository" >&2 && return 1; }

    [[ -n "$1" ]] || { echo "Must specify branch to switch to" >&2 && exit 1; }

    git switch "$1" && git pull
}

# git log -> fzf -> get hash -> rebase interactive
gri() {
    [[ -d "$(git rev-parse --show-toplevel 2>&1)" ]] || { echo "Not a git repository" >&2 && return 1; }

    print -z "git rebase -i $(gl)"
}

# git log -> fzf -> get hash -> commit fixup
gfup() {
    [[ -d "$(git rev-parse --show-toplevel 2>&1)" ]] || { echo "Not a git repository" >&2 && return 1; }

    git commit --fixup "$(gl)"
}
