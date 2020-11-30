" Common
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Normal mode switch
noremap <C-[> <esc>

noremap L $
noremap H ^

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Adding new line
nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

" Save
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> zz :wall<CR>
nnoremap <silent> zq :wall<CR>:qa<CR>

" Navigate between buffer
nmap <Leader>] :bnext <CR>
nmap <Leader>[ :bprevious <CR>
nmap <Leader>x :bp\|bd #<CR>

" Split
nnoremap <Leader>- <C-w>s
nnoremap <Leader>_ <C-w>v

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize panel
noremap <silent> <C-Left>  :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up>    :resize -3<CR>
noremap <silent> <C-Down>  :resize +3<CR>

" Copy and paste
vnoremap <C-c> "+y :let @*=@+<CR>                       " Copy and paste to clipboard

" ----------------------------------------------------------------------
" Other
" ----------------------------------------------------------------------
nnoremap <Leader>ve :e $VIMRC<CR>						" Reload
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Leader> :silent! nohls<CR>			" Turn off hightlight after search

" Move panel
nnoremap <Leader>th <C-w>t<C-w>H " V to H
nnoremap <Leader>tk <C-w>t<C-w>K " H to V
