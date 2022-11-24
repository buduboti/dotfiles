autoload -U edit-command-line
zle -N edit-command-line
bindkey -e

# https://www.gnu.org/software/bash/manual/html_node/Bindable-Readline-Commands.html
bindkey '≥' insert-last-word			# M-.
bindkey 'ƒ' forward-word				# M-f
bindkey '∫' backward-word				# M-b
bindkey '¯' beginning-of-history		# M-<
bindkey '˘' beginning-of-history		# M->
bindkey '†' transpose-words				# M-t
bindkey 'ç' capitalize-word				# M-c
bindkey '∂' kill-word					# M-d


