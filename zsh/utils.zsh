# source: https://github.com/nicknisi/dotfiles/blob/master/zsh/utils.zsh
dotfiles::exists() {
    command -v "$1" > /dev/null 2>&1
}

dotfiles::is_git() {
    [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

dotfiles::bold() {
    echo -n "%B$1%b"
}

dotfiles::print() {
    local color content bold
    [[ -n "$1" ]] && color="%F{$1}" || color="%f"
    [[ -n "$2" ]] && content="$2" || content=""

    [[ -z "$2" ]] && content="$1"

    echo -n "$color"
    echo -n "$content"
    echo -n "%{%b%f%}"
}

git_current_branch () {
    local ref
    ref="$(git symbolic-ref --quiet HEAD 2>/dev/null)"
    local ret=$?
    if [[ $ret != 0 ]]
    then
        [[ $ret == 128 ]] && return 0
        ref=$(git rev-parse --short HEAD 2>/dev/null)  || return 0
    fi
    echo "${ref#refs/heads/}"
}
