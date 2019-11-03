
echo "Hi $USER!"

IP=`~/.dotfiles/bin/mylip`

if [ $USER != "root" ]; then
	PROMPT_SYMBOL="%{$fg[red]%}"$IP"%{$fg[yellow]%}#%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :"
else
	PROMPT_SYMBOL="%{$fg[green]%}"$IP"%{$fg[yellow]%}#%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%~%{$reset_color%}% :"
fi

export PROMPT="$PROMPT_SYMBOL%f "
export RPROMPT=""
