" Sort lines
nnoremap <Leader>s vip:!sort<cr>
vnoremap <Leader>s :!sort<cr>

" Easier linewise reselection
nnoremap <Leader>V V`]

" Quickly edit your vimrc
nnoremap <Leader>ev :edit $MYVIMRC<cr>

" Show the registers from things cut/yanked
nnoremap <Leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
" nnoremap <Leader>0 "0p
" nnoremap <Leader>1 "1p
" nnoremap <Leader>2 "2p
" nnoremap <Leader>3 "3p
" nnoremap <Leader>4 "4p
" nnoremap <Leader>5 "5p
" nnoremap <Leader>6 "6p
" nnoremap <Leader>7 "7p
" nnoremap <Leader>8 "8p
" nnoremap <Leader>9 "9p

" Reset syntax highlighting
nnoremap <Leader>u :syntax sync fromstart<cr>:redraw!<cr>

" Diffoff
nnoremap <Leader>D :diffoff!<cr>

" Source a line/selection
nnoremap <Leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
vnoremap <Leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>

" Toggle [i]nvisible characters
nnoremap <Leader>i :set list!<cr>

" Clear match highlighting
nnoremap <silent> <Leader><space> :noh<cr>:call clearmatches()<cr>

" Toggle "keep current line in the center of the screen" mode
nnoremap <Leader>C :let &scrolloff=999-&scrolloff<cr>

" Open a Quickfix window for the last search.
nnoremap <silent> <Leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <Leader>z mzzMzvzz15<C-e>`z:Pulse<cr>

" Run Make for current file
map <silent> <Leader>m <Esc>:make<CR>:cw<CR>

" Ag with motions
nnoremap <silent> <Leader>A :set opfunc=miniplugins#AgMotion<CR>g@
xnoremap <silent> <Leader>A :<C-U>call miniplugins#AgMotion(visualmode())<CR>

" Highlight up to 6 different interesting words
nnoremap <silent> <Leader>1 :call miniplugins#HiInterestingWord(1)<cr>
nnoremap <silent> <Leader>2 :call miniplugins#HiInterestingWord(2)<cr>
nnoremap <silent> <Leader>3 :call miniplugins#HiInterestingWord(3)<cr>
nnoremap <silent> <Leader>4 :call miniplugins#HiInterestingWord(4)<cr>
nnoremap <silent> <Leader>5 :call miniplugins#HiInterestingWord(5)<cr>
nnoremap <silent> <Leader>6 :call miniplugins#HiInterestingWord(6)<cr>