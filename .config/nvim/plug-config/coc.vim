" let g:coc_global_extensions = [
"   \ 'coc-yaml',
"   \ 'coc-css',
"   \ 'coc-html',
"   \ 'coc-json',
"   \ 'coc-vimlsp',
"   \ 'coc-python',
"   \ 'coc-sh',
"   \ 'coc-tsserver',
"   \ ]

" Trigger quick fix, work like coc-action
nmap <silent> <leader>a :CocFix<CR>
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ----------------------------------------------------------------------
" Extension Config
" ----------------------------------------------------------------------
"  coc-pair
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
