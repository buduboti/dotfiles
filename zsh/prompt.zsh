
autoload -U colors && colors
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

add-zsh-hook precmd vcs_info
add-zsh-hook precmd async_trigger

IP=`~/.dotfiles/bin/mylip`

if [ $USER != "root" ]; then
	PROMPT_SYMBOL="%{$fg[red]%}"$IP"%{$fg[yellow]%}#%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :"
else
	PROMPT_SYMBOL="%{$fg[green]%}"$IP"%{$fg[yellow]%}#%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :"
fi

export PROMPT="$PROMPT_SYMBOL%f "

# RET_VAL="%(?..%{$fg[red]%}! )"

# inspired by: https://github.com/nicknisi/dotfiles/blob/master/zsh/prompt.zsh

source $DOTFILES/zsh/utils.zsh
source $DOTFILES/zsh/git_prompt.zsh

ASYNC_PROC=0

function async() {
	printf "%s" "$(git_status)" > "/tmp/zsh_prompt_$$"

	kill -s USR1 $$

	if [[ "${ASYNC_PROC}" != 0 ]]; then
		kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
	fi
}

function async_trigger() {
	ASYNC_PROC=$!
	async &!
}

function TRAPUSR1() {
	vcs_info
	RPROMPT='$(cat /tmp/zsh_prompt_$$)'
	ASYNC_PROC=0

	zle && zle reset-prompt
}

export RPROMPT=""
