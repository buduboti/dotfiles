
alias c=clear
alias q=exit
alias :q=exit

alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

if ls --color -d . >/dev/null 2>&1; then
	alias ls="ls --color"
	alias l="ls -l --color"
	alias ll="ls -la --color"
elif ls -G -d . >/dev/null 2>&1; then
	alias ls="ls -G"
	alias l="ls -lG"
	alias ll="ls -laG"
else
	SOLARIS_LS=1
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

where nvim >/dev/null
if [ $? -eq 0 ];
then
	alias vim="nvim"
fi

alias dot="cd $DOTFILES"

alias grep="grep --color=always"

alias path="echo $PATH | tr ':' '\n'"

alias weather="curl wttr.in"
