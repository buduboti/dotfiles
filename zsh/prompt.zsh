
autoload -U colors && colors
autoload -Uz vcs_info

echo "Hi $USER!"

IP=`~/.dotfiles/bin/mylip`

if [ $USER != "root" ]; then
	PROMPT_SYMBOL="%{$fg[red]%}"$IP"%{$fg[yellow]%}#%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :"
else
	PROMPT_SYMBOL="%{$fg[green]%}"$IP"%{$fg[yellow]%}#%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :"
fi

export PROMPT="$PROMPT_SYMBOL%f "

RET_VAL="%(?..%{$fg[red]%}! )"

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
GIT_BRANCH="%{$fg[green]%}"'${vcs_info_msg_0_}'

export RPROMPT="$RET_VAL$GIT_BRANCH"
