
# https://www.gnu.org/software/bash/manual/html_node/Commands-For-History.html
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^Y' yank-last-arg
bindkey -M viins '^R' bck-i-search
bindkey -M viins '^T' transpose-chars

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey -M viins '^_' insert-last-word

# https://www.gnu.org/software/bash/manual/html_node/Commands-For-Moving.html
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^F' forward-char
bindkey -M viins '^B' backward-char
bindkey -M viins 'ƒ' forward-word
bindkey -M viins '∫' backward-word

