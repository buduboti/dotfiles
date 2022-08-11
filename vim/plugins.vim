" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'ThePrimeagen/vim-be-good'

" Declare the list of plugins.
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mbbill/undotree'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
Plug 'szw/vim-tags'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/tComment'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()
