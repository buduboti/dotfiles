" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'ThePrimeagen/vim-be-good'

" Declare the list of plugins.
Plug 'neovim/nvim-lsp'
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mfukar/robotframework-vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'szw/vim-tags'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/tComment'
Plug 'mattn/vim-fz'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
