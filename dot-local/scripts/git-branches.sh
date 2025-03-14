#!/bin/bash

function listBranchWithDescription() {
    branches=$(git branch --list $1)

    print_string="\033[31;1mBranch\033[0m\t\033[31;1mRemote\033[0m\t\033[31;1mDescription\033[0m\n"

    while read -r branch; do
        # git marks current branch with "* ", remove it
        clean_branch_name=${branch//\*\ /}
        # replace colors
        clean_branch_name=$(echo $clean_branch_name | tr -d '[:cntrl:]' | sed -E "s/\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
        # replace symbolic-ref like `HEAD -> master`
        clean_branch_name=$(echo $clean_branch_name | sed -E "s/^.+ -> //g")

        description=$(git config branch.$clean_branch_name.description)
        remote=$(git config branch.$clean_branch_name.remote)
        merge=$(git config branch.$clean_branch_name.merge | cut --delimiter="/" --fields=3-)

        if [ "${branch::1}" == "*" ]; then
            print_string="${print_string}${branch}"
        else
            print_string="${print_string}  ${branch}"
        fi

        if [ ! -z "$remote" ] && [ ! -z "$merge" ]; then
            print_string="${print_string}\t\e[1;34m[${remote}/${merge}]\e[0m"
        else
            print_string="${print_string}\t"
        fi

        print_string="${print_string}\t${description}\n"
    done <<<"$branches"

    printf "$print_string" | column --table --separator $'\t'
}

# @see [git-branch](https://git-scm.com/docs/git-branch)
if [[ "$@" = "" ]]; then
    listBranchWithDescription "--color"
elif [[ "$@" =~ "--color" || "$@" =~ "--no-color" ]]; then
    listBranchWithDescription "$@"
else
    branch_operation_result=$(git branch $@)
    printf "$branch_operation_result\n"
fi
