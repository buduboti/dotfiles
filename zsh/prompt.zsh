
autoload -U colors && colors
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

add-zsh-hook precmd vcs_info
add-zsh-hook precmd async_trigger

function () {
  if [[ -n "$TMUX" ]]; then
     LVL=$(($SHLVL - 1))
    else
     LVL=$SHLVL
  fi
}

# inspired by: https://github.com/nicknisi/dotfiles/blob/master/zsh/prompt.zsh

source $DOTFILES/zsh/utils.zsh
source $DOTFILES/zsh/jobs_prompt.zsh
source $DOTFILES/zsh/git_prompt.zsh

ASYNC_PROC=0
MODE_COLOR=""

function async() {
	printf "%s" "$(suspended_jobs) $(git_status)" > "/tmp/zsh_prompt_$$"

	if [[ $EUID -eq 0 ]]; then
		MACHINE_COLOR="red"
		USER_COLOR="green"
	else
		MACHINE_COLOR="green"
		USER_COLOR="red"
	fi

	if [[ $LVL -gt 1 ]];then
		SHELL_LEVEL=$LVL
	else
		SHELL_LEVEL=""
	fi
	
	printf "%s" "%{$fg[$MACHINE_COLOR]%}%m%{$fg[${${KEYMAP/vicmd/red}/(main|viins)/yellow}]%}#$SHELL_LEVEL%{$fg[$USER_COLOR]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :%f " > "/tmp/zsh_prompt_ip_$$"

	kill -s USR1 $$

	if [[ "${ASYNC_PROC}" != 0 ]]; then
		kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
	fi
}

function zle-line-init zle-keymap-select {
	async &!
}

zle -N zle-line-init
zle -N zle-keymap-select

function async_trigger() {
	ASYNC_PROC=$!
	async &!
}

function TRAPUSR1() {
	vcs_info
	RPROMPT='$(cat /tmp/zsh_prompt_$$)'
	PROMPT='$(cat /tmp/zsh_prompt_ip_$$)'
	ASYNC_PROC=0

	zle && zle reset-prompt
}

export RPROMPT=""
export PROMPT=""
