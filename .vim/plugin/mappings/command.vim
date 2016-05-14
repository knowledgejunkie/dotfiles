" command mode history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

