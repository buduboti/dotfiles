
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

function async() {
	printf "%s" "$(suspended_jobs) $(git_status)" > "/tmp/zsh_prompt_$$"

	IP=`~/.dotfiles/bin/mylip`

	if [[ $EUID -eq 0 ]]; then
		if [[ $LVL -eq 1 ]];then
			printf "%s" "%{$fg[red]%}"$IP"%{$fg[yellow]%}#%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :%f " > "/tmp/zsh_prompt_ip_$$"
		else
			printf "%s" "%{$fg[red]%}"$IP"%{$fg[yellow]%}#"$LVL"%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :%f " > "/tmp/zsh_prompt_ip_$$"
		fi
	else
		if [[ $LVL -eq 1 ]];then
			printf "%s" "%{$fg[green]%}"$IP"%{$fg[yellow]%}#%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :%f " > "/tmp/zsh_prompt_ip_$$"
		else
			printf "%s" "%{$fg[green]%}"$IP"%{$fg[yellow]%}#"$LVL"%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :%f " > "/tmp/zsh_prompt_ip_$$"
		fi
	fi

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
	PROMPT='$(cat /tmp/zsh_prompt_ip_$$)'
	ASYNC_PROC=0

	zle && zle reset-prompt
}

export RPROMPT=""
export PROMPT=""
