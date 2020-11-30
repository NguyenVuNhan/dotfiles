if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:python3_host_prog = '/usr/bin/python3'
let g:BASH_Ctrl_j = 'off'


" Auto command
" autocmd FileType c,cpp,h nnoremap <Leader>d <C-]>			" Goto definition
" autocmd BufWritePost *.c,*.cpp,*.h silent! !ctags -R &		" Auto update tag

" Prettier
highlight Pmenu guibg=black gui=bold
highlight PmenuSel guibg=grey gui=bold
highlight PmenuSbar guibg=grey gui=bold
highlight PmenuThumb guibg=black gui=bold

syntax enable                           " Enables syntax highlighting

set foldlevel=99                         " Unfold 3 level by default
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continuation of comments
set hidden                              " Required to keep multiple buffers open multiple buffers
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set relativenumber
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set ttimeoutlen=0
set incsearch
set guifont=Fira\ Code\ Nerd\ Font
set belloff=all
set foldcolumn=0
set scrolloff=50						" Keep cursor in center
set pastetoggle=<F3>
set nowrap

autocmd FileType c,cpp,typescript,typescriptreact,*.py
    \ setlocal foldmethod=syntax        " Folding
autocmd BufWritePre * %s/\s\+$//e		" Remove trailling white space
