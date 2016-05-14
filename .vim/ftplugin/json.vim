au FileType json setlocal autoindent
au FileType json setlocal formatoptions=tcq2l
au FileType json setlocal textwidth=78 shiftwidth=2
au FileType json setlocal softtabstop=2 tabstop=8
au FileType json setlocal expandtab
au FileType json setlocal foldmethod=syntax

" tidy/pretty-print via json_pp
nnoremap <Leader>jt :%!json_pp<cr>
vnoremap <Leader>jt :!json_pp<cr>
