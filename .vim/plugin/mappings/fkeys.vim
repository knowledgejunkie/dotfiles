" Lights off
nnoremap <silent> <F1> :Goyo<CR>

" Execute current file
map <F4> <Esc>:w<CR>:!%:p<CR>

" shortcut to toggle spelling
nnoremap <silent> <F7> :setlocal spell! spelllang=en_gb<CR>

" Highlight Group(s)
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" toggle display of hidden characters
inoremap <silent> <F9> <Esc>:setlocal list!<CR>a
nnoremap <silent> <F9> :setlocal list!<CR>

