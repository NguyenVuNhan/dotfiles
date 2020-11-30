" nerdtree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore=[
	\ '^node_modules$',
	\ '\.idea$', '\.vscoe$',
	\ '\.DS_Store$',
	\ '\.git$',
	\ '\.swp$', '\tags$',
	\ '\.o$', '\.ko$', '\.cmd$', '\.symvers$', '\.order$', '\.mod.c$', '\.tmp_versions$',
	\ '^__pycache__$'
	\ ]
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

autocmd VimEnter * call NERDTreeAddKeyMap({
       \ 'key': '{',
       \ 'callback': "NERDTreeOpenInGoogleChrome",
       \ 'quickhelpText': 'Open file in google chrome'})
function! NERDTreeOpenInGoogleChrome()
	echo "Hello"
    let treenode = g:NERDTreeFileNode.GetSelected()
    if treenode !=# {}
        call system("google-chrome '" . treenode.path.str() . "'")
	else
		let treenode = g:NERDTreeBookmark.GetSelected()
    	if treenode !=# {}
			call system("google-chrome '" . treenode.path.str() . "'")
		endif
    endif
endfunction

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! NERDTreeOpen()
	if !IsNERDTreeOpen()
		NERDTreeFind
	else
		NERDTreeToggle
	endif
endfunction

" nmap <C-b> :call NERDTreeOpen()<CR>
let NERDTreeWinPos = 'left'
nmap <C-b> :call NERDTreeOpen() <CR>
