source $XDG_CONFIG_HOME/nvim/general/settings.vim
source $XDG_CONFIG_HOME/nvim/general/key-mappings.vim

call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
    " themming
    Plug 'hzchirs/vim-material'
    Plug 'vim-airline/vim-airline'
call plug#end()

source $XDG_CONFIG_HOME/nvim/plug-config/bookmarks.vim
source $XDG_CONFIG_HOME/nvim/plug-config/commentary.vim
source $XDG_CONFIG_HOME/nvim/plug-config/fzf.vim
source $XDG_CONFIG_HOME/nvim/plug-config/theming.vim
source $XDG_CONFIG_HOME/nvim/plug-config/emmet.vim
source $XDG_CONFIG_HOME/nvim/plug-config/coc.vim
