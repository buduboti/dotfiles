if [[ $EUID -eq 0 ]]; then
	PS1="\[\033[31m\]"`$DOTFILES/bin/mylip`"\[\033[33m\]#\[\033[32m\]\u\[\033[00m\]@\[\033[34m\]\w\[\033[00m\]: "
else
	PS1="\[\033[32m\]"`$DOTFILES/bin/mylip`"\[\033[33m\]#\[\033[31m\]\u\[\033[00m\]@\[\033[34m\]\w\[\033[00m\]: "
fi
