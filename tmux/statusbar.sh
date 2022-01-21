# source: Nick Nisi (https://github.com/nicknisi/dotfiles/blob/master/tmux/base16.sh)

# Base16 Styling Guidelines:
base00=default   # - Default
base01='#151515' # - Lighter Background (Used for status bars)
base02='#202020' # - Selection Background
base03='#909090' # - Comments, Invisibles, Line Highlighting
base04='#505050' # - Dark Foreground (Used for status bars)
base05='#D0D0D0' # - Default Foreground, Caret, Delimiters, Operators
base06='#E0E0E0' # - Light Foreground (Not often used)
base07='#F5F5F5' # - Light Background (Not often used)
base08='#AC4142' # - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
base09='#D28445' # - Integers, Boolean, Constants, XML Attributes, Markup Link Url
base0A='#F4BF75' # - Classes, Markup Bold, Search Text Background
base0B='#90A959' # - Strings, Inherited Class, Markup Code, Diff Inserted
base0C='#75B5AA' # - Support, Regular Expressions, Escape Characters, Markup Quotes
base0D='#6A9FB5' # - Functions, Methods, Attribute IDs, Headings
base0E='#AA759F' # - Keywords, Storage, Selector, Markup Italic, Diff Changed
base0F='#8F5536' # - Deprecated, Opening/Closing Embedded Language Tags, e.g. <? php ?>

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set-option -g status-style fg=$base01,bg=$base04,default
set-option -g status-bg $base04

set-window-option -g window-status-style fg=$base03,bg=$base04
set-window-option -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-style fg=$base0C,bg='#373737'
set-window-option -g window-status-current-format " #[bold]#W"

# pane border colors
set-window-option -g pane-active-border-style fg=$base0C
set-window-option -g pane-border-style fg=$base03

# message text
set-option -g message-style bg=$base04,fg=$base0C

# pane number display
set-option -g display-panes-active-colour $base0C
set-option -g display-panes-colour $base01

# clock
set-window-option -g clock-mode-colour $base0C

tm_host_name="#[bg=$base04,fg=$base0B,bold] #(cut --field=1 --delimiter='.' /etc/hostname)"
tm_session_name="#[default,bg=$base04,fg=$base0E] #S "
set -g status-left "$tm_host_name $tm_session_name"

tm_tunes="#[bg=$base04,fg=$base0D] ♫ #($DOTFILES/bin/music.sh)"
tm_battery="#[fg=$base0B,bg=$base04] #($DOTFILES/bin/battery)"
tm_date="#[default,bg=$base04,fg=$base0C] %R"
tm_host="#[fg=$base0E,bg=$base04] #($DOTFILES/bin/ssid) "
set -g status-right "$tm_tunes $tm_battery $tm_date $tm_host"
