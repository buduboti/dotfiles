
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

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:git:*' formats "%{$fg[green]%}%b%f %m%c%u"
zstyle ':vcs_info:git+set-message:*' hooks git-untracked

function +vi-git-untracked() {
	emulate -L zsh
	if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
		hook_com[unstaged]+="%F{blue}●%f"
	fi
}

setopt PROMPT_SUBST
GIT_BRANCH='${vcs_info_msg_0_}'

export RPROMPT="$RET_VAL$GIT_BRANCH"
