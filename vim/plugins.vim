" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'szw/vim-tags'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()